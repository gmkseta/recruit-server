class TextForm < ApplicationRecord
    has_one :question, as: :questionable
    
end
