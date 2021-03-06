require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'pry'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cleaner
  class Application < Rails::Application

    config.generators do |g|
      g.assets = false
      g.helper = false
    end

    # Установка пути к ресурсам bootstrap  
    config.assets.paths << "#{Rails.root}/vendor/assets/fonts"
    # Совместимость bootstrap-sass с файлопроводом
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.assets.precompile += %w(*.svg *.eot *.woff *.ttf)
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Переопределение div с отображением ошибки
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| 
        "<span class='form-horizontal has-error'>#{html_tag}</span>".html_safe 
    }

  end
end
