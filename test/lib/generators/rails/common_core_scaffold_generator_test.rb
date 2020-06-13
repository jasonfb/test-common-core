require 'test_helper'
require 'generators/rails/common_core_scaffold/common_core_scaffold_generator'

class Rails::CommonCoreScaffoldGeneratorTest < Rails::Generators::TestCase
  tests Rails::CommonCoreScaffoldGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
