class Question < ApplicationRecord
    belongs_to :questionable, polymorphic: true
    belongs_to :form_sheet
    accepts_nested_attributes_for :questionable
    enum status: [:not_answer , :answer]
    
    
    

    def type_under
        self.questionable_type.underscore
    end
    
    # def questionable_attributes=(questionable_attributes, options = {})
    #     self.questionable ||= questionable_type.constantize.new
    #     questionable.localized.assign_attributes(questionable_attributes, options)
    # end    

    
end
