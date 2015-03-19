ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'

# Uncomment for awesome colorful output
# require 'minitest/pride'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  fixtures :all

  def set_form_authenticity_token
    session[:_csrf_token] = SecureRandom.base64(32)
  end

  def post_with_token(symbol, args_hash)
    args_hash.merge!(authenticity_token: set_form_authenticity_token)
    post symbol, args_hash
  end
end
