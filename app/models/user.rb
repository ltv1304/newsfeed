class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  # validates_confirmation_of :password
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
end
