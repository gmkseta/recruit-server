class GenerateForm
  attr_reader :question
 
  def initialize(form_sheet_id, type)
    form_sheet = FormSheet.find(form_sheet_id)
    @question= form_sheet.questions.create({questionable: Formatter.for( type)})
  end
  
end

class Formatter
  def self.for(type)
    case type
    when 'TextForm'
      TextForm.new
    else
      raise 'Unsupported type of report'
    end
  end
end