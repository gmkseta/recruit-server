class Question < ApplicationRecord
    belongs_to :questionable, polymorphic: true
    belongs_to :form_sheet
end
