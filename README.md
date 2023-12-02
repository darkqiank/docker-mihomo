## 项目介绍

Github Repo: [izumiko/docker-mihomo](https://github.com/izumiko/docker-mihomo)

## 如何使用

默认配置目录为 `/root/.config/mihomo` ，可通过环境变量 `MIHOMO_CONFIG_DIRECTORY` 修改。

```shell
docker run --name mihomo -d \
    -p 7890:7890 \
    -p 7891:7891 \
    -p 7892:7892 \
    -p 9090:9090 \
    -v /path/to/config:/root/.config/mihomo \
    izumiko/mihomo
```
