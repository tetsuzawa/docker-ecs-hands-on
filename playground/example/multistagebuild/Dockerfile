FROM golang:latest AS build

# プロジェクトに必要なツールをインストール
# 依存関係を更新するには「docker build --no-cache」を実行（キャッシュを無効化するオプション）
RUN apk add --no-cache git
RUN go get github.com/golang/dep/cmd/dep

# Gopkg.toml と Gopkg.lock はプロジェクトの依存関係の一覧
# Gopkg ファイルが更新された時のみ、レイヤを再構築
COPY go.mod go.sum /app
WORKDIR /app
# ライブラリの依存関係をインストール
RUN go mod download

# プロジェクト全体をコピーし、構築
# プロジェクトのディレクトリ内でファイルの変更があれば、レイヤを再構築
COPY . /app
RUN go build -o /bin/genid

# 結果として、１つのレイヤ・イメージになる
FROM alpine
COPY --from=build /bin/genid /bin/genid
CMD ["/bin/genid"]