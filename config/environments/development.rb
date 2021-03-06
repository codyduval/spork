Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false
      # Action Mailer default options
      config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

      # Setup for Mailcatcher, if present
      if `which mailcatcher`.length > 0
        config.action_mailer.delivery_method = :smtp
        config.action_mailer.smtp_settings = { address: "localhost", port: 1025 }
      end

      # Specify locations for mails previews
      config.action_mailer.preview_path = "spec/mailers/previews"

      # Use email template for emails except on devise mails sent for admin users
      config.to_prepare do
        ActionMailer::Base.layout proc { |mailer|
          if mailer.is_a?(Devise::Mailer) && mailer.scope_name == :admin_user
            nil
          else
            "email"
          end
        }
      end


  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  config.react.variant = :development
end
