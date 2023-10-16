class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:top, :show, :edit]

  def top 
    
  end

  def show
    @user = current_user
    # @user.id = current_user.id
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.introduction = params[:introduction]

    if @user.update(user_params)
      flash[:notice] = "自己紹介文を編集しました"
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = '更新できませんでした'
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:introduction, :avatar)
  end

end
