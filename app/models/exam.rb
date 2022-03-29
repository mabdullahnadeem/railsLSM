# frozen_string_literal: true

class Exam < ApplicationRecord
  belongs_to :course, optional: true
  has_many :questions
end
