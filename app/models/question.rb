class Question < ApplicationRecord
  belongs_to :exam
  has_one :answer
end
