class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:top, :show, :edit]

  def top 
    
  end

  def show
    @user = current_user

    current_month = Date.today.month
    last_month = 1.month.ago.month
    last_last_month = 2.months.ago.month

    @backend_data_current_month = @user.skills.backend.for_month(current_month).sum(:learning_time)
    @backend_data_last_month = @user.skills.backend.for_month(last_month).sum(:learning_time)
    @backend_data_last_last_month = @user.skills.backend.for_month(last_last_month).sum(:learning_time)

    @frontend_data_current_month = @user.skills.frontend.for_month(current_month).sum(:learning_time)
    @frontend_data_last_month = @user.skills.frontend.for_month(last_month).sum(:learning_time)
    @frontend_data_last_last_month = @user.skills.frontend.for_month(last_last_month).sum(:learning_time)

    @infrastructure_data_current_month = @user.skills.infrastructure.for_month(current_month).sum(:learning_time)
    @infrastructure_data_last_month = @user.skills.infrastructure.for_month(last_month).sum(:learning_time)
    @infrastructure_data_last_last_month = @user.skills.infrastructure.for_month(last_last_month).sum(:learning_time)

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
      render :edit, status: :unprocessable_entity 
    end
  end

  private
  def user_params
    params.require(:user).permit(:introduction, :avatar)
  end

end
