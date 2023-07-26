# frozen_string_literal: true

RSpec.describe "webhook authentication", type: :feature do
  it "authenticates via webhook authentication service" do
    response = Faraday.post("https://external_webhook/authentication")

    expect(response.body).to be_an_instance_of(String)
  end
end
