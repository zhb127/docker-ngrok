# 使用说明

> 本镜像主要参考：[https://github.com/hteen/docker-ngrok](https://github.com/hteen/docker-ngrok)，由于在使用过程中，存在一些问题，故基于该仓库做了一些调整，并完善。

## 构建镜像

```bash
git clone https://github.com/zhb127/docker-ngrok.git
cd docker-ngrok/server
docker build -t zhb127/ngrok-server .
```

## 运行容器

拷贝配置文件：

```bash
cp docker-compose.yml.example docker-compose.yml
```

修改 `docker-compose.yml` 配置文件，将 `NGROK_DOMAIN` 修改成自己的域名。

> 注意，这里需要将修改的域名以及子域名（泛）解析到当前服务器 IP。例如：`yourdomain.com`、`*.yourdomain.com` 解析到当前服务器 IP。

运行：

```bash
docker-compose up -d
```

> 注意，第一次运行容器，需要等候一会儿，之后会在当前目录下 `myfiles` 文件夹中，生成：证书、ngrokd、ngrok 可执行文件等。其中，`ngrok` 将作为构建 ngrok-client 镜像必要的文件。
