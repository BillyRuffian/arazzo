module Arazzo
  class Document
    class SourceDescription
      attr_accessor :name, :url, :type

      def initialize(name:, url:, type: nil)
        @name = name
        @url = url
        @type = type
      end

      def self.from_hash(hash)
        SourceDescription.new(
          name: hash[:name],
          url: hash[:url],
          type: hash[:type]
        )
      end
    end
  end
end
