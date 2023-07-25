# frozen_string_literal: true

require "faraday"

# Emits data to webhook
class Push
  def initialize(webhook:)
    @webhook = webhook
  end

  def push
    connection.post("post") do |request|
      request.body = webhook.body
    end
  rescue Faraday::Error => e
    puts e.response[:status]
    puts e.response[:body]
  end

  private

  attr_accessor :webhook

  def connection
    @connection ||= Faraday.new(url: webhook.url, headers: webhook.headers) do |builder|
      # Sets the Content-Type header to application/json on each request.
      # Also, if the request body is a Hash, it will automatically be encoded as JSON.
      builder.request :json

      # Parses JSON response bodies.
      # If the response body is not valid JSON, it will raise a Faraday::ParsingError.
      builder.response :json

      # Raises an error on 4xx and 5xx responses.
      builder.response :raise_error

      # Logs requests and responses.
      # By default, it only logs the request method and URL, and the request/response headers.
      builder.response :logger
    end

    # TODO: Add auth handling in next iteration
    # A simple example implementation for MyAuthStorage
    # class MyAuthStorage
    #   def self.get_auth_token
    #     rand(36 ** 8).to_s(36)
    #   end
    # end
  end
end
