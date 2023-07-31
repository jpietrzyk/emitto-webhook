# frozen_string_literal: true

require_relative "webhook/version"
require_relative "webhook/push"
require_relative "webhook/data_objects/webhook"

module Emitto
  # Sends data to webhook
  module Webhook
    def self.push(webhook: DataObjects::Webhook.new)
      Push.new(webhook:).push
    end
  end
end
