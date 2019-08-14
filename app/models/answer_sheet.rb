class AnswerSheet < ApplicationRecord
  belongs_to :question_sheet
  has_many :answers
end
