require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BooksService
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.active_job.queue_adapter = :sidekiq

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, key: '_your_app_session'

    config.after_initialize do
      p "after_initialize GetBooksJob  "
      # GetBooksJob.perform_in(1.minutes, 'bob', 5)
    end

    config.active_record.database_selector = { delay: 2.seconds }
    config.active_record.database_resolver = ActiveRecord::Middleware::DatabaseSelector::Resolver
    config.active_record.database_resolver_context = ActiveRecord::Middleware::DatabaseSelector::Resolver::Session

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = false
  end
end
