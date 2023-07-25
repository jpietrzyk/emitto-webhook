# frozen_string_literal: true

module DataObjects
  Webhook = Data.define(:url, :headers, :body) do
    def initialize(url: "", headers: {}, body: {})
      super
    end
  end
end
