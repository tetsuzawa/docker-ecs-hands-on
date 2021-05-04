# 5分でわかる Dockerfile ベストプラクティス


- できるだけ小さなイメージを使う
  - イメージのダウンロードが速い
  - メモリへの読み込みも速い
  - 実機のストレージも圧迫しない

- 適切なベースイメージを選ぶ
  - goのイメージがあるなら最初から使う
- マルチステージビルド
  - ビルド時に使用する依存ライブラリが多いとimageが大きくなる
  - マルチステージビルドで生成物のみをimageに含める
- ビルドキャッシュを適切に活用しよう
  - ADD, COPYではファイルの中身をみてキャッシュを使うか決定する
  - ADD, COPY以外では実行コマンド文字列そのものがキャッシュの一致判断に用いられる
  - RUN 
    - RUN apt-get upgradeやRUN apt-get dist-upgradeの実行は行わない
      - 必要ならベースイメージを変えるか開発者に報告する
    - apt-get updateとapt-get installは同一のRUNコマンドで実行する
        - ```
          RUN apt-get update && apt-get install -y \
          package-bar \
          package-baz \
          package-foo
          ```
        - ```
          RUN apt-get update 
          RUN apt-get install -y \
          package-bar \
          package-baz \
          package-foo
          ```
          とするとinstallするファイルを変更したとしてもキャッシュのせいで古いバージョンを使い続ける恐れがある
        - 良い例
          - ```
            RUN apt-get update && apt-get install -y \
            package-bar \
            package-baz \
            package-foo=1.1.2 \
            && rm -rf /var/lib/apt/lists/*
            ```
          - バージョンを明示的に指定することで確実にキャッシュの更新をすることができる 
          - aptのリストを削除してイメージを小さく 

- ADDとCOPYの違い
  - ADDもCOPYもローカルファイルをコンテナにコピーするために使う
  - ADDにはtarファイルを自動展開する機能やURLからファイルを取得する機能がある
    - `ADD http://example.com/big.tar.xz /usr/src/things/`
  - 基本はCOPYを使えば良い

- ENTRYPOINTとCMD
  - ENTRYPOINTはdocker runの引数を末尾につけて実行してくれる
  - ENTRYPOINTはイメージに対してメインのコマンドを設定するために使う
  - https://github.com/flyway/flyway-docker/blob/master/Dockerfile
  - 使い方 `docker run --rm flyway/flyway $(FLYWAY_CONF) migrate`

- .dockerignore
  - 巨大なファイルや取り扱い注意のファイルを不用意に送信してしまうことが避けられる
  - > Docker では Go 言語の filepath.Match ルールを拡張して、特別なワイルドカード文字列 ** をサポートしています。 これは複数のディレクトリ（ゼロ個を含む）にマッチします。 たとえば **/*.go は、ファイル名が .go で終わるものであって、どのサブディレクトリにあるものであってもマッチします。 ビルドコンテキストのルートも含まれます。
  - https://qiita.com/munisystem/items/b0f08b28e8cc26132212

- RUN
  - `RUN echo hello`の形式ではデフォルトで `/bin/sh -c`の引数として実行される
  - /bin/sh以外を使いたいときは `RUN ["/bin/bash", "-c", "echo hello"]`
  - RUN にはシェル変数を含めない
  - RUNのキャッシュ TODO
- パイプ 
  - 正常処理されたかどうかは、パイプの最後の処理の終了コードにより評価されます。
  - `RUN wget -O - https://some.site | wc -l > /number`
  - これが成功するかどうかはwc -lの成功にかかっている
  - wgetが失敗していたときに気づけない可能性がある
  - `RUN set -o pipefail && wget -O - https://some.site | wc -l > /number`
  - これをつけて実行する
> RUN cd /tmp を実行したとしても、次の命令には何の効果も与えません。

- CMD 
  - 3つの形式がある
  - 推奨されるのは`CMD ["executable","param1","param2"]`(exec形式)
  - exec 形式は JSON 配列として解釈されます。 したがって文字列をくくるのはダブル・クォート（"）であり、シングル・クォート（'）は用いてはなりません。
  - `RUN [ "echo", "$HOME" ]`では$HOMEが置換されない
    - `RUN [ "sh", "-c", "echo $HOME" ]`を使わなければならない
  - DockerfileではCMD命令を１つしか記述できない
  - CMDはフルパスで書く
  - RUNとCMDのち外
    - RUNはイメージビルドのときに実際にコマンドが実行されて、結果を確定させる
    - CMDはイメージビルド時には何も実行しない。イメージに対して実行する予定のコマンドを指示するもの

- ビルドキャッシュ
  - RUN ADD COPY などはキャッシュを作る
  - 共通化できるコマンドはできるだけまとめる



- docker-composeで起動コマンドを指定するモチベーション
  - 開発環境と本番環境でコマンドを変えられる
    - `npm run dev` `npm run`

- ECS
  - データプレーンとコントロールプレーンがある
    - コントロール
      - ECS
    - データプレーン
      - EC2
      - Fargate
      

- 環境変数
  - SSMを使う
  - S3から読み込む
  - task_defに直接入れる

## コラム

- .dockerignoreとかCMDのファイルパスのパターンマッチについて
  - dockerはGoで開発されてる
  - パターンマッチはfilepath.Matchに基づく





