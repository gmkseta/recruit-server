class Answer < ApplicationRecord
  belongs_to :answer_sheet
  belongs_to :question
  belongs_to :answerable, polymorphic: true
end
