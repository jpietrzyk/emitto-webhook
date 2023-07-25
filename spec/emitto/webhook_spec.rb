# frozen_string_literal: true

RSpec.describe Emitto::Webhook do
  it "has a version number" do
    expect(Emitto::Webhook::VERSION).not_to be nil
  end
end
