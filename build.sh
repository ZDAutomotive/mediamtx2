#!/bin/bash

NAME=mediamtx:1.8.4
REGISTRY=test.zddata.cloud:8443/cloud

docker build -t $NAME .
# 登录
docker login $REGISTRY
# 为本地镜像添加标签
docker tag $NAME $REGISTRY/$NAME
# 推送
docker push $REGISTRY/$NAME