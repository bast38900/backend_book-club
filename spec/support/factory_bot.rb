require 'factory_bot'

# Add FactoryBot to RSpec
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end