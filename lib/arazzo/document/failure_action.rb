module Arazzo
  class Document
    class FailureAction
      attr_accessor :name, :type, :workflow_id, :step_id, :retry_after, :retry_limit, :criteria

      def initialize(name:, type:, workflow_id: nil, step_id: nil, retry_after: nil, retry_limit: nil, criteria: [])
        @name = name
        @type = type
        @workflow_id = workflow_id
        @step_id = step_id
        @retry_after = retry_after
        @retry_limit = retry_limit
        @criteria = criteria
      end

      def self.from_hash(hash)
        new(
          name: hash[:name],
          type: hash[:type],
          workflow_id: hash[:workflow_id],
          step_id: hash[:step_id],
          retry_after: hash[:retry_after],
          retry_limit: hash[:retry_limit],
          criteria: hash[:criteria]&.map { |crit| Criterion.from_hash(crit) } || []
        )
      end

      def to_hash
        {
          name: name,
          type: type,
          workflow_id: workflow_id,
          step_id: step_id,
          retry_after: retry_after,
          retry_limit: retry_limit,
          criteria: criteria
        }
      end
    end
  end
end
