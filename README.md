## 项目介绍

[github repo]: https://github.com/izumiko/docker-clash-meta

## 如何使用

默认配置目录为 `/root/.config/clash` ，可通过环境变量 `CLASH_META_CONFIG_DIRECTORY` 修改。

docker run --name clash -d \
    -p 7890:7890 \
    -p 7891:7891 \
    -p 7892:7892 \
    -p 9090:9090 \
    -v /path/to/config:/root/.config/clash \
    izumiko/clash-meta
