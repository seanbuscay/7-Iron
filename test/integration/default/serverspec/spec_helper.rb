require 'serverspec'
set :backend, :ssh
RSpec.configure do |config|
  # config.profile_examples = 10
  # config.fail_fast = TRUE
  # config.reset
  # config.output_stream = 'results.html'
  # config.formatter = 'html'
  config.output_stream = '/var/www/html/specs.txt'
  config.formatter = 'documentation'
end
