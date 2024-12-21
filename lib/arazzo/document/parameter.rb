module Arazzo
  class Document
    class Parameter
      attr_accessor :name, :in_location, :value

      def initialize(name:, in_location:, value:)
        @name = name
        @in_location = in_location
        @value = value

        return if %i[path query header body].include?(@in_location)

        raise ArgumentError,
              "in_location must be one of [:path, :query, :header, :body], given '#{in_location}'"
      end

      def self.from_hash(hash)
        Parameter.new(
          name: hash[:name],
          in_location: hash[:in].to_sym,
          value: hash[:value]
        )
      end
    end
  end
end
