class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nick_name, :email, :first_name, :first_name_kana, :family_name, :family_name_kana, :password, :password_confirmation, :birth)
  end
end
  