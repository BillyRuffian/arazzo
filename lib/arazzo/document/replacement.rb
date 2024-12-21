module Arazzo
  class Document
    class Replacement
      attr_accessor :target, :value

      def initialize(target:, value:)
        @target = target
        @value = value
      end

      def self.from_hash(hash)
        new(
          target: hash[:target],
          value: hash[:value]
        )
      end
    end
  end
end
