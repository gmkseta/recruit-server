class GenerateForm
  attr_reader :question

  def initialize(params, answer=true)

    question_sheet = QuestionSheet.find(params[:question_sheet_id])

    # if answer
    #   question = Question.find(params[:id])
    #   questionable = question.questionable.dup
    #   questionable.assign_attributes(question_params(params))
    #   @question= question_sheet.questions.create(questionable: questionable, parent: question)
    # else
    @question= question_sheet.questions.create({questionable: Formatter.for( params[:type]), priority: question_sheet.questions.count})
    # end
  rescue Exception => e
    p e
  end

  # private

  # def question_params params
  #   params.fetch(:question,{}).fetch(:questionable_attributes, {}).permit!
  # end

end

class Formatter
  def self.for(type)
    case type
    when 'TextForm'
      TextForm.new
    when 'StringForm'
      StringForm.new
    else
      raise 'Unsupported type of report'
    end
  end
end
