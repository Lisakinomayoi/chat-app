class UsersController < ApplicationController
  def edit

  end 

  def update
    if current_user.update(user_params)#current_userメソッドにユーザー情報が格納されている
       redirect_to root_path#成功するとroot_pathに戻る
    else 
      render :edit#保存できなかった場合editのビューに戻る
    end   
  end  

  private
  def user_params
    params.require(:user).permit(:name, :email) #nameとemailの編集を許可(updateから呼び出し)
  end  
end
