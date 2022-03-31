class Exam < ApplicationRecord
  belongs_to :course, optional: true
  belongs_to :user
  has_many :questions
end
