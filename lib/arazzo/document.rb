module Arazzo
  class Document
    attr_accessor :specification_version, :info, :source_descriptions,
                  :workflows, :components

    def initialize(specification_version:, info:, source_descriptions:, workflows:, components: nil)
      @specification_version = specification_version
      @info = info
      @source_descriptions = source_descriptions
      @workflows = workflows
      @components = components
    end

    def self.from_hash(hash)
      Document.new(
        specification_version: hash[:arazzo],
        info: Info.from_hash(hash[:info]),
        source_descriptions: hash[:sourceDescriptions].map { |sd| SourceDescription.from_hash(sd) },
        workflows: hash[:workflows].map { |wf| Workflow.from_hash(wf) },
        components: Components.from_hash(hash[:components])
      )
    end
  end
end
