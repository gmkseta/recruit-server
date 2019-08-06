class GenerateForm
  attr_reader :question
 
  def initialize(params , answer=1)
    form_sheet = FormSheet.find(params[:form_sheet_id])
    
    @question= form_sheet.questions.create({questionable: Formatter.for( params[:type]), status: answer})

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