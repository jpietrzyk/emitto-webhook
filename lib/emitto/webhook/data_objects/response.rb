# frozen_string_literal: true

module DataObjects
  Response = Data.define(:url, :headers, :body) do
    def initialize(status: 200, headers: {}, body: "")
      super
    end
  end
end
