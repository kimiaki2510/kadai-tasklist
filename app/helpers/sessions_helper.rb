module SessionsHelper
  def current_user
    #現在ログインしているユーザの取得
    #既に現在のログインユーザが代入されていたら何もせず
    #代入されていなかったら User.find(...) からログインユーザを取得し、@current_user に代入
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    #定義した current_user を使って、ユーザが現在ログインしているかを調べます。存在していれば、ログインユーザのインスタンスが返る
    !!current_user
  end
end
