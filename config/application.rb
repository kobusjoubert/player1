require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Player1
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Pretoria'

    # Let active record return datetime values instead of nil.
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_attributes = false

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # HAML.
    config.generators do |g|
      g.template_engine :haml
    end

    # Add fonts and theme to the assets pipeline.
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    # Heroku

    # Amazon S3 & Paperclip
    config.paperclip_defaults = {
      storage: :s3,
      s3_credentials: "#{Rails.root}/config/s3.yml",
    }

    # Devise
    # 4. If you are deploying on Heroku with Rails 3.2 only, you may want to set:
    # config.assets.initialize_on_precompile = false
    # On config/application.rb forcing your application to not access the DB or load models when precompiling your assets.
    config.assets.initialize_on_precompile = false
  end
end
