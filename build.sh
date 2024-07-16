#!/bin/bash

#打包
docker build -t mediamtx:1.8.4 .

# 登录
docker login admin@test.zddata.cloud:8443
# 为本地镜像添加标签
docker tag mediamtx:1.8.4 test.zddata.cloud:8443/cloud/mediamtx:1.8.4
# 推送
docker push test.zddata.cloud:8443/cloud/mediamtx:1.8.4