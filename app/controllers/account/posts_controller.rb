class Account::PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @posts = current_user.posts.recent.paginate(:page => params[:page], :per_page => 5)
    end

    def edit
        @group = Group.find(params[:group_id])
        @post = @group.posts.find(params[:id])
    end

    def update
        @group = Group.find(params[:group_id])
        @post = @group.posts.find(params[:id])

        if @post.update(post_params)
            redirect_to account_posts_path, notice: "修改成功"
        else
            render :edit
        end
    end

    def destroy
        @group = Group.find(params[:group_id])
        @post = @group.posts.find(params[:id])
        @post.destroy
        flash[:alert] = '文章删除'
        redirect_to account_posts_path
    end
end
