class GroupsController < ApplicationController

    before_action :authenticate_user! ,only: [:new, :create, :edit, :update, :destroy, :join, :quit]
    before_action :find_group_and_check_permission, only: [:edit, :update, :destroy]

    # 帖子列表页面
    def index
        @groups = Group.all
    end

    # 帖子详情页面
    def show 
        @group = Group.find(params[:id])
        @posts = @group.post.recent.paginate(:page => params[:page], :per_page => 5)
    end

    # 新增帖子页面
    def new
        @group = Group.new
    end

    # 新增帖子 POST
    def create
        @group = Group.new(group_params)
        @group.user = current_user

        if (@group.save)
            current_user.join!(@group)
            redirect_to groups_path, notice: "新增成功"
        else
            render :new
        end
    end

    # 修改帖子页面
    def edit  
    end

    # 修改帖子 PUT
    def update

        if @group.update(group_params)
            redirect_to groups_path, notice: "修改成功"
        else
            render :edit
        end
    
    end

    # 删除帖子 DELETE
    def destroy

        @group.destroy
        # flash[:alert] = "Group deleted"
        # redirect_to groups_path
        redirect_to groups_path, notice: "Group deleted"
    end

    def join
        @group = Group.find(params[:id])

        if !current_user.is_member_of?(@group)
            current_user.join!(@group)
            flash[:notice] = "加入本讨论版成功！"
        else    
            flash[:warning] = "你已经是本讨论版成员了！"
        end

        redirect_to group_path(@group)        
    end

    def quit
        @group = Group.find(params[:id])

        if current_user.is_member_of?(@group)
            current_user.quit!(@group)
            flash[:alert] = "已退出本讨论版！"
        else
            flash[:warning] = "你不是本讨论版成员，怎么退出 XD"
        end

        redirect_to group_path(@group)
    end


    private

        def find_group_and_check_permission
            @group = Group.find(params[:id])

            if current_user != @group.user
                redirect_to root_path, alert: "你没有权限修改此帖子！"
            end
        end


        def group_params
            params.require(:group).permit(:title, :description)
        end
end
