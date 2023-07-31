# frozen_string_literal: true

require "sinatra/base"

class FakeWebhook < Sinatra::Base
  # TODO: Add endpoints for every authentication methods like bearer, simple etc.
  post "/webhook/authentication" do
    json_response 200
  end

  private

  def json_response(response_code)
    content_type :json
    status response_code
    { foo: "bar" }.to_json
  end
end
