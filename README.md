# docker-server
常用php环境docker配置

# 首次使用
- 以下执行都基于当前根目录下
- 安装/更新image执行 docker-composer build
- 已有镜像生成启动容器docker-composer up -d
- 部分服务分为不同服务搭建，cd到对应目录构建镜像例如nsq、redis-cluster等
- 自有配置目录已被忽略，首次构建容器需要配置对应本地挂载目录

	~~~
		/logs
		/mysql/logs
		/mysql/mysql
		/nginx/sites
		/elasticsearch/data
		hosts
	~~~
