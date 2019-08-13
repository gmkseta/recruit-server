class Question < ApplicationRecord
    belongs_to :questionable, polymorphic: true
    belongs_to :form_sheet
    accepts_nested_attributes_for :questionable
    has_many :questions, class_name: "Question", foreign_key: "parent_id"
    belongs_to :parent, class_name: "Question", optional: true   
    def type_under
        self.questionable_type.underscore
    end
end
