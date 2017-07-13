require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Trending
  class Application < Rails::Application
    config.generators do |generators|
      generators.test_framework  :rspec, fixture: false
      generators.javascripts false
      generators.helper false
      generators.view_specs false
      generators.helper_specs false
      generators.controller_specs true

      generators.model_specs true
      generators.fixtures false

      generators.stylesheets false
      generators.decorator_specs false
      generators.decorator false
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
