class Exam < ApplicationRecord
  belongs_to :course, optional: true
  has_many :questions
end
