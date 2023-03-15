class GroupsController < ApplicationController

    # 帖子列表页面
    def index
        @groups = Group.all
    end

    # 帖子详情页面
    def show 
        @group = Group.find(params[:id])
    end

    # 新增帖子页面
    def new
        @group = Group.new
    end

    # 新增帖子 POST
    def create
        @group = Group.new(group_params)
        @group.save

        redirect_to groups_path
    end

    # 修改帖子页面
    def edit
        @group = Group.find(params[:id])
    end

    # 修改帖子 PUT
    def update
        @group = Group.find(params[:id])
        @group.update(group_params)

        redirect_to groups_path, notice: "修改成功"
    end

    # 删除帖子 DELETE
    def destroy
        @group = Group.find(params[:id])
        @group.destroy

        flash[:alert] = "Group deleted"
        redirect_to groups_path
        # redirect_to groups_path, notice: "Group deleted"
    end


    private
        def group_params
            params.require(:group).permit(:title, :description)
        end
end
