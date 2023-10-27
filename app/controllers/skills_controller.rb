class SkillsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @backend_skills = @user.skills.backend
    @frontend_skills = @user.skills.frontend
    @infrastructure_skills = @user.skills.infrastructure
  end

  def new
    @skill = @user.skills.build
    @category = params[:category]
    @category_japanese = I18n.t("enums.skill.category.#{@category}")
  end

  def create
    @skill = @user.skills.build(skill_params)
    @skill.category = params[:skill][:category]
    if @skill.valid? && @skill.save
      redirect_to user_skills_path(@user), notice: "スキルが登録されました。"
    else
      flash.now[:alert] = 'スキルの登録に失敗しました。'
      render :new
    end  
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_update_params) 
      redirect_to user_skills_path(@user), notice: 'スキルが更新されました'
    else
      render 'index'
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    if @skill.destroy
      redirect_to user_skills_path(@user), notice: 'スキルが削除されました'
    else
      redirect_to user_skills_path(@user),status: :see_other, alert: 'スキルの削除に失敗しました'
    end
  end


  private

  def set_user
    @user = current_user
  end

  def skill_params
    params.require(:skill).permit(:skill, :learning_time)
  end

  def skill_update_params
    params.require(:skill).permit(:learning_time)
  end
end
