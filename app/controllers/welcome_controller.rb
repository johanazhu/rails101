class WelcomeController < ApplicationController
    def index
        #flash[:notice] = "早安！你好！"
        # flash[:alert] = "晚安！再见！"
        flash[:warning] = "这是 warning 信息！"
    end
end
