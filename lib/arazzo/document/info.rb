module Arazzo
  class Document
    class Info
      attr_accessor :title, :summary, :description, :version

      def initialize(title:, version:, summary: nil, description: nil)
        @title = title
        @summary = summary
        @description = description
        @version = version
      end

      def self.from_hash(hash)
        Info.new(
          title: hash[:title],
          summary: hash[:summary],
          description: hash[:description],
          version: hash[:version]
        )
      end
    end
  end
end
