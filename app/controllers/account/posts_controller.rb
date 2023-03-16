class Account::PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @posts = current_user.posts.recent.paginate(:page => params[:page], :per_page => 5)
    end

    def edit
        # post.group, post
        @post = Post.find()
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to account_posts_path, notice: "更新成功"
        else
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to account_posts_path, alert: "删除成功"
    end
end
