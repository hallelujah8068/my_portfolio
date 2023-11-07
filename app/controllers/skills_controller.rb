class SkillsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  skip_before_action :verify_authenticity_token

  def index
    @selected_month = params[:month].to_i 
    @selected_month = Date.today.month if @selected_month.zero?

    @backend_skills = @user.skills.backend.for_month(@selected_month)
    @frontend_skills = @user.skills.frontend.for_month(@selected_month)
    @infrastructure_skills = @user.skills.infrastructure.for_month(@selected_month)
  end

  def new
    @skill = @user.skills.build
    @category = params[:category]
    @category_japanese = I18n.t("enums.skill.category.#{@category}")
  end

  def create
    @skill = @user.skills.build(skill_params)
    @skill.category = params[:skill][:category]
    @category = @skill.category
    @category_japanese = I18n.t("enums.skill.category.#{@category}")
    if @skill.save
      modal_message = "#{@category_japanese}に#{@skill.skill}を#{@skill.learning_time}分で追加しました！"
      render json: { modal_message: modal_message }
    else
      render json: { errors: @skill.errors.full_messages }, status: :unprocessable_entity
    end
  end  

  def update
    @skill = Skill.find(params[:id])
    
    if @skill.update(skill_update_params)
      skill_name = @skill.skill
      modal_message = "#{skill_name}の学習時間を保存しました！"
      render json: { modal_message: modal_message }
    else
      render json: { errors: @skill.errors.full_messages }, status: :unprocessable_entity
    end
  end
   
  def destroy
    @skill = Skill.find(params[:id])
    
    if @skill.destroy
      skill_name = @skill.skill
      modal_message = "#{skill_name}を削除しました。"
      render json: { modal_message: modal_message }
    else
      render json: { errors: "削除に失敗しました" }, status: :unprocessable_entity
    end
  end  


  private

  def set_user
    @user = current_user
  end

  def skill_params
    params.require(:skill).permit(:skill, :learning_time, :category)
  end

  def skill_update_params 
    params.require(:skill).permit(:learning_time)
  end
end
