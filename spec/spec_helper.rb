require_relative '../environment.rb'
require 'rack/test'

ENV['RACK_ENV'] = "test"

module RSpecMixin
  include Rack::Test::Methods
  def app() FormsLab::App end
end

RSpec.configure { |c| c.include RSpecMixin }
