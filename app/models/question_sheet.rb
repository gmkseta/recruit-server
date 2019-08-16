class QuestionSheet < ApplicationRecord
    has_many :questions    
    has_many :answer_sheets
    belongs_to :team
end
