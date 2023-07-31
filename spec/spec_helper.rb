# frozen_string_literal: true

require "emitto/webhook"
require "webmock/rspec"
require "rack/test"
require "pry"
require_relative "support/fake_webhook"

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    stub_request(:post, "https://external_webhook/authentication").to_rack(FakeWebhook)
    stub_request(:post, "https://external_webhook/event").to_rack(FakeWebhook)
  end
end
