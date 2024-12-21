module Arazzo
  class Document
    class Workflow
      attr_accessor :workflow_id, :summary, :description, :inputs, :depends_on, :steps, :success_actions,
                    :failure_actions, :outputs, :parameters

      def initialize(workflow_id:, steps:, summary: nil, description: nil, inputs: nil, depends_on: [],
                     success_actions: [], failure_actions: [], outputs: {}, parameters: [])
        @workflow_id = workflow_id
        @summary = summary
        @description = description
        @inputs = inputs
        @depends_on = depends_on
        @steps = steps
        @success_actions = success_actions
        @failure_actions = failure_actions
        @outputs = outputs
        @parameters = parameters
      end

      def self.from_hash(hash)
        Workflow.new(
          workflow_id: hash[:workflowId],
          summary: hash[:summary],
          description: hash[:description],
          inputs: hash[:inputs].is_a?(Hash) ? JSONSchema.from_hash(hash[:inputs]) : hash[:inputs],
          depends_on: hash[:dependsOn] || [],
          steps: hash[:steps].map { |step| Step.from_hash(step) },
          success_actions: hash['successActions']&.map { |sa| SuccessAction.from_hash(sa) } || [],
          failure_actions: hash['failureActions']&.map { |fa| FailureAction.from_hash(fa) } || [],
          outputs: hash['outputs'] || {},
          parameters: hash['parameters']&.map { |param| Parameter.from_hash(param) } || []
        )
      end
    end
  end
end
