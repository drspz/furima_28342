class UsersController < ApplicationController

  def edit
  end

  def show
    user = User.find(params[:id])
    @nick_name = user.nick_name
    @items = user.items
   
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
    params.require(:user).permit(:nick_name, :first_name, :first_name_kana, :family_name, :family_name_kana, :password, :password_confirmation, :birth)
  end
end
  