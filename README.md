# 介绍

脱离 Docker 依赖直接在系统上搭建 Discourse 基础环境.

主要把 [discourse_docker](https://github.com/discourse/discourse_docker) 的 Dockerfile 转成 shell 脚本, 用 shell 脚本直接在主机安装 Discourse 的 gifsicle pngcrush 等依赖.

discourse_docker 使用的是 ubuntu 16.04 ,所以主机的系统必须得用 ubuntu 16.04 .

discourse_docker 使用 runit 启动 web server, sidekiq 等.但普通的 ubuntu 默认是使用 systemd ,所以 web server 和 sidekiq 等进程的启动,你得像普通的 rails 应用,使用 god 或 monit 之类的进程管理软件来启动.


# 注意:

不要把此脚本在有运行生产环境的应用的机器上面运行,因为安装脚本在安装完成后会删除 /tmp/ 下的所有文件.推荐在刚装完系统的新机器上面运行.


# 使用

复制 discourse_shell 目录到线上机器,执行 ./install-discourse-base.sh 即可.

# 更新

convert_to_shell.sh 文件是把 discourse_docker 项目的 Dockerfile 转换成 discourse_shell ,执行后, 会生成 /tmp/discourse_shell .

更新后也许会不兼容,依赖的软件的下载地址会变.
