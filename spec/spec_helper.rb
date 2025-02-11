require 'bundler/setup'

require 'linear_search'
require 'binary_search'

Dir["#{File.expand_path(__dir__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  # config.example_status_persistence_file_path = '.rspec_status'
  # config.filter_run :focus

  config.order = :random

  # config.expect_with :rspec do |c|
  #   c.syntax = :expect
  # end
end
