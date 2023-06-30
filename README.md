# Rails101

## 说明

这个项目，是在 [李笑来当初五万的全栈营](https://fullstack.qzy.camp/) 中的初级学习项目：rails101

## 如何启动

```bash
rails s
```

## 部署

起初部署到 [fly.io](https://fly.io/)，但因为自身还有两个项目已经部署上，为嫖免费，下架它

现部署到 [zeabur](https://zeabur.com/)，暂不支持 ruby on rails（目前2023-06-30）裸部署，笔者通过 dockerfile 部署之


镜像：`docker build -t rails101 .`
基于 rails101 镜像生成容器：`docker run -d -p 3000:3000 rails101`
