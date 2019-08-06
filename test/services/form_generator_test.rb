require 'test_helper'

class FormGeneratorTest < ActiveSupport::TestCase
 setup do
   @form_generator = FormGenerator.create!()
 end

 test "form_generator 생성" do
   form_generator_id = @form_generator.id
   service = FormGeneratorService.new(form_generator_id)
   pp service.build_form_generator(form_generator_id).attributes
 end
end