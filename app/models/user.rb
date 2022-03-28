class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :role_id, presence: true
  belongs_to :role
  has_many :user_courses
  has_many :courses, through: :user_courses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
