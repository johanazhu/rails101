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


    private
        def group_params
            params.require(:group).permit(:title, :description)
        end
end
