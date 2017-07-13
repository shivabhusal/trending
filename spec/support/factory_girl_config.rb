# this will make `create`, `build` method available directly
#   no need to write like `FactoryGirl.create(:blahblah)`
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
