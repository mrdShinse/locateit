# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Locateit
  class Application < Rails::Application # :nodoc:
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = %i[ja en]
    config.i18n.default_locale = :ja

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|
      g.template_engine   :slim
      g.stylesheet_engine :scss
      g.javascript_engine :coffee
      g.system_tests      nil
      g.test_framework    :rspec,
                          fixture: true,
                          fixture_replacement: :factory_bot,
                          view_specs: false,
                          routing_specs: false,
                          helper_specs: false
      g.factory_bot       true,
                          dir: 'spec/factories'
    end
  end
end
