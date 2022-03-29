# frozen_string_literal: true

class Course < ApplicationRecord
  has_one :exam, dependent: :destroy
  has_many :user_courses
  has_many :users, through: :user_courses
  validates :name, uniqueness: true
end
