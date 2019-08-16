class Answer < ApplicationRecord
  belongs_to :answer_sheet
  belongs_to :question
  belongs_to :answerable, polymorphic: true
  accepts_nested_attributes_for :answerable


  def build_answerable(params)
      #raise "Unknown answerable_type: #{answerable_type}" unless ANSWERABLE_TYPES.include?(answerable_type)
      self.answerable = answerable_type.constantize.new(params)
  end

  
end
