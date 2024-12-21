module Arazzo
  class Document
    class Criterion
      attr_accessor :context, :condition, :type

      def initialize(condition:, context: nil, type: :simple)
        @context = context
        @condition = condition
        @type = type
      end

      def self.from_hash(hash)
        new(
          context: hash[:context],
          condition: hash[:condition],
          type: hash[:type]&.to_sym || :simple
        )
      end
    end
  end
end
