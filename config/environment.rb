require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/react_tutorial'
require_relative '../apps/tutorial/application'

Hanami.configure do
  mount Tutorial::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/react_tutorial_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/react_tutorial_development'
    #    adapter :sql, 'mysql://localhost/react_tutorial_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/react_tutorial/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []

    mailer do
      delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    end
  end
end
