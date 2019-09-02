class SessionsController < ApplicationController
  def new
  end

  def create
    #フォームデータの二段階で指定取得,email部分は小文字化
    email = params[:session][:email].downcase
    password = params[:session][:password]
    #emailとpasswordでログイン可能
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      #@userのusers#showへリダイレクト
      redirect_to @user
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      #sessions/new.html.erbを再表示
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  #login(email, passsword)の定義
  private

  def login(email, password)
    @user = User.find_by(email: email)
    #@userが存在するか@userのパスワードが合っているか
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
