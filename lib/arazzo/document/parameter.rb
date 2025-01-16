module Arazzo
  class Document
    class Parameter
      attr_accessor :name, :in_location, :value

      def initialize(name:, in_location:, value:)
        @name = name
        @in_location = in_location unless in_location.nil? || in_location.empty?
        @value = value
      end

      def self.from_hash(hash)
        Parameter.new(
          name: hash[:name],
          in_location: hash[:in]&.to_sym,
          value: hash[:value]
        )
      end
    end
  end
end
