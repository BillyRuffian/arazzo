module Arazzo
  class Document
    class SuccessAction
      attr_accessor :name, :type, :workflow_id, :step_id, :criteria

      def initialize(name:, type:, workflow_id: nil, step_id: nil, criteria: [])
        @name = name
        @type = type
        @workflow_id = workflow_id
        @step_id = step_id
        @criteria = criteria
      end

      def self.from_hash(hash)
        SuccessAction.new(
          name: hash[:name],
          type: hash[:type],
          workflow_id: hash[:workflowId],
          step_id: hash[:stepId],
          criteria: hash[:criteria]&.map { |crit| Criterion.from_hash(crit) } || []
        )
      end
    end
  end
end
