class ApplicationController < ActionController::Base
  before_action :authenticate_user!#ログインしていないユーザーをログインページに促す
  before_action :configure_permitted_parameters, if: :devise_controller?#deviseのコントローラーから呼び出された場合cofigure_permitted_parametersメソッドが呼び出される.下で定義
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end  #devise_parameter_sanitizerメソッドは特定のカラムを許容する（今回はnameキーの保存）
end

