require 'ibge'
require 'vcr'
require 'webmock/rspec'
require 'simplecov'

SimpleCov.start do
  add_filter '/spec'
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
end

RSpec.configure do |config|
  config.order = :random

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect

    mocks.verify_partial_doubles = true
  end
end