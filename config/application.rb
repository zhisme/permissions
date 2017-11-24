require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Permissions
  class Application < Rails::Application
    config.generators do |g|
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.template_engine false
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       model_spec: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: true,
                       request_specs: false
    end
  end
end
