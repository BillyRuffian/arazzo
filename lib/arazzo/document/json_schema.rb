module Arazzo
  class Document
    class JSONSchema
      attr_accessor :schema

      def initialize(schema:)
        @schema = schema
      end

      def self.from_hash(hash)
        new(
          schema: hash[:schema]
        )
      end

      def validate(data)
        JSON::Validator.validate(schema, data)
      end
    end
  end
end
