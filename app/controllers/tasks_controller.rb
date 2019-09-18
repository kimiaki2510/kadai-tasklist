class TasksController < ApplicationController
    before_action :require_user_logged_in
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    #before_action :correct_user, only: [:edit, :update, :show, :destroy]
    
    def index
        @tasks = current_user.tasks.page(params[:page]).per(3)
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = current_user.tasks.build(task_params)
        @task.user_id = current_user.id
        if @task.save
            flash[:success] = 'Taskが正常に投稿されました'
            redirect_to @task
        else
            flash.now[:danger] = 'Taskが投稿されませんでした'
            render :new
        end
    end
    
    def edit
        set_task
    end
    
    def update
        set_task
        if @task.update(task_params)
            flash[:success] = 'Taskは正常に更新されました'
            redirect_to @task
        else
            flash.now[:danger] = 'Taskは更新されませんでした'
            render :edit
        end
    end
    
    def destroy
        set_task
        @task.destroy
        flash[:success] = 'Taskは正常に削除されました'
        redirect_to tasks_url
    end
    
    def show
        if current_user == @task.user
            set_task
        else
            redirect_to root_url
        end
    end
    
    private
    
    def set_task
        @task = Task.find(params[:id])
    end
    
    def task_params
        params.require(:task).permit(:content, :status)
    end
    
    #def correct_user
        #@task = Task.find(params[:id])
        #if current_user.id = @task.user.id
            #redirect_to root_url
        #end
    #end
    
end
