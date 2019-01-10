# 使用说明

> 前提条件，ngrok-server 容器已成功运行。同时，在 `../server/myfiles` 目录下，已生成 `bin/ngrok` 可执行文件。

## 构建镜像

```bash
cp ../server/myfiles/bin/ngrok ./ngrok
cp ./docker-compose.yml.example ./docker-compose.yml
```

拷贝 `docker-compose.yml` 配置文件，修改指定环境变量。

```bash
docker-compose build
```

## 运行

```bash
docker-compose up -d
```
