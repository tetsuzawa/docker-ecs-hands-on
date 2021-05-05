.PHONY: build login push

ACCOUNT := tetsuzawa_el
ACCOUNT_ALIAS := 126223625663
CONTAINER := hands-on-web

build:
	docker build --no-cache -t $(ACCOUNT_ALIAS).dkr.ecr.ap-northeast-1.amazonaws.com/$(CONTAINER):latest .

login:
	aws ecr get-login-password --profile $(ACCOUNT) --region ap-northeast-1 | docker login --username AWS --password-stdin $(ACCOUNT_ALIAS).dkr.ecr.ap-northeast-1.amazonaws.com

push:
	docker push $(ACCOUNT_ALIAS).dkr.ecr.ap-northeast-1.amazonaws.com/$(CONTAINER):latest


