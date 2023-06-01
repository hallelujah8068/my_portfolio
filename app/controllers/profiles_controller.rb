class ProfilesController < ApplicationController
  def show
    if user_signed_in?
      @profile = current_user.profile 
    else
      render :show
    end
  end

  def edit
  end

  def update
  end
end
