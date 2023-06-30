# Rails101

如何启动
`rails s`

https://hub.docker.com/_/rails

dockerfile
镜像：`docker build -t rails101 .`
基于 rails101 镜像生成容器：`docker run -d -p 3000:3000 rails101`
