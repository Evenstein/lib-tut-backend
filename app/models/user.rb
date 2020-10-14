class User < ApplicationRecord
  include Validations::Users
  # Include default devise modules. Others available are:
  # :recoverable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :rememberable, :validatable

  has_many :refresh_tokens, dependent: :destroy
end
