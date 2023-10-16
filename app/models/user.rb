class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  validates :introduction, length: { minimum: 50, maximum: 199 }, on: :update
         
  # with_options on: :registrations do
    validates :name, presence: :true       
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i       
    validates :email, presence: true, uniqueness: true,
              format:{ with: VALID_EMAIL_REGEX, message: "メールアドレスに不正な値が入力されています"}

    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}+\z/i
    validates :password, presence: true,
              format: { with: VALID_PASSWORD_REGEX,
                message: "は英数字を含む8文字以上で設定してください"}, if: :password_required?
  # end     

  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
end

