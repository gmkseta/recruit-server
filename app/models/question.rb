class Question < ApplicationRecord
    belongs_to :questionable, polymorphic: true
    belongs_to :question_sheet
    accepts_nested_attributes_for :questionable
    has_many :answers
    belongs_to :parent, class_name: "Question", optional: true   
    
    def type_under
        self.questionable_type.underscore
    end

    def build_answer
        answer = self.answers.build
        answer.answerable = self.questionable
        answer
    end
end
