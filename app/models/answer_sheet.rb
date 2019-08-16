class AnswerSheet < ApplicationRecord
  belongs_to :question_sheet
  belongs_to :user
  has_many :answers
  accepts_nested_attributes_for :answers

  def answerables
    answers.map{|a| a.answerable}
  end
end
