class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy]
    def index
        @tasks = Task.order(id: :desc).page(params[:page]).per(25)
        #@tasks = current_user.tasks.page(params[:page]).per(25)
        #@tasks = Task.order(id: :desc).page(params[:page]).per(3)
        #@tasks = Task.find_by(id: params[:id])
        #@user = User.find_by(id: @task.user_id)
    end
    
    def new
        #@task = Task.new
        @task = Task.new(
        status: params[:status],
        content: params[:content],
        user_id: @current_user.id
            )
    end
    
    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
            flash[:success] = 'Taskが正常に投稿されました'
            redirect_to @task
        else
            flash.now[:danger] = 'Taskが投稿されませんでした'
            render :new
        end
    end
    
    def edit
        ensure_correct_user
    end
    
    def update
        ensure_correct_user
        if @task.update(task_params)
            flash[:success] = 'Taskは正常に更新されました'
            redirect_to @task
        else
            flash.now[:danger] = 'Taskは更新されませんでした'
            render :edit
        end
    end
    
    def destroy
        ensure_correct_user
        @task.destroy
        flash[:success] = 'Taskは正常に削除されました'
        render root_url
    end
    
    def show
        set_task
    end
    
    private
    
    def ensure_correct_user
        set_task
        if @task.user_id != @current_user.id
            flash[:notice] = '権限がありません'
            redirect_to root_url
        end
    end
    
    def set_task
        #@task = Task.find(params[:id])
        #@task = Task.find(params[:id])
        @task = Task.find_by(id: params[:id])
    end
    
    def task_params
        params.require(:task).permit(:content, :status)
    end
    
end
