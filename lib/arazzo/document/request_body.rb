module Arazzo
  class Document
    class RequestBody
      attr_accessor :content_type, :payload, :replacements

      def initialize(payload:, content_type: nil, replacements: [])
        @content_type = content_type
        @payload = payload
        @replacements = replacements
      end

      def self.from_hash(hash)
        new(
          content_type: hash[:content_type],
          payload: hash[:payload],
          replacements: hash[:replacements]&.map { |repl| Replacement.from_hash(repl) } || []
        )
      end
    end
  end
end
