require 'test_helper'

class GenerateSeedTest < ActiveSupport::TestCase
 setup do
   @generate_seed = GenerateSeed.create!()
 end

 test "generate_seed 생성" do
   generate_seed_id = @generate_seed.id
   service = GenerateSeedService.new(generate_seed_id)
   pp service.build_generate_seed(generate_seed_id).attributes
 end
end