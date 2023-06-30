FROM ruby:3.1.3-slim

# build-essential（用于构建软件包）
# libpq-dev（用于 PostgreSQL 连接）
# nodejs（用于 Rails asset 预编译）
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# 换源
RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/

# 设置工作目录
WORKDIR /app

# 将 Gemfile 和 Gemfile.lock 复制到容器中
COPY Gemfile* ./

# 安装项目依赖
RUN bundle install

# 将整个项目目录复制到容器中
COPY . .

# 设置环境变量
# ENV RAILS_ENV production
# ENV RAILS_SERVE_STATIC_FILES true

# # 预编译 assets
# RUN rake assets:precompile

# 暴露应用端口
EXPOSE 3000

# 启动 Rails 服务器
CMD ["rails", "server", "-b", "0.0.0.0"]
