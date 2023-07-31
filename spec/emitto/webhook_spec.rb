# frozen_string_literal: true

RSpec.describe Emitto::Webhook do
  it "has a version number" do
    expect(Emitto::Webhook::VERSION).not_to be nil
  end

  describe ".push" do
    subject(:push_service) { described_class.push(webhook:) }

    let!(:webhook) { DataObjects::Webhook.new(url: webhook_url, body: webhook_body, headers: webhook_headers) }

    let(:webhook_url) { "https://external_webhook/event" }
    let(:webhook_body) { {} }
    let(:webhook_headers) { {} }

    let(:response_status) { 200 }
    let(:response_body) { "" }
    let(:response_headers) { {} }

    before do
      stub_request(:post, webhook.url)
        .with(body: webhook.body)
        .to_return(status: response_status, body: response_body, headers: response_headers)
    end

    context "when webhook works" do
      it "sends data to webhook" do
        expect(push_service).to be_a Faraday::Response
      end
    end

    context "when webhook doesn't work" do
      context "when webhook doesn't exist" do
        let(:response_status) { 404 }

        it "sends data to webhook" do
          expect { push_service }.to raise_error(Errors::ConnectionError, "the server responded with status 404")
        end
      end

      context "when webhook has internal error" do
        let(:response_status) { 500 }

        it "sends data to webhook" do
          expect { push_service }.to raise_error(Errors::ConnectionError, "the server responded with status 500")
        end
      end
    end
  end
end
