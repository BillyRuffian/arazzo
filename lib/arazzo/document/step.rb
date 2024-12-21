module Arazzo
  class Document
    class Step
      attr_accessor :step_id, :description, :operation_id, :operation_path, :workflow_id, :parameters, :request_body,
                    :success_criteria, :on_success, :on_failure, :outputs

      def initialize(step_id:, description: nil, operation_id: nil, operation_path: nil, workflow_id: nil,
                     parameters: [], request_body: nil, success_criteria: [], on_success: [], on_failure: [], outputs: {})
        @step_id = step_id
        @description = description
        @operation_id = operation_id
        @operation_path = operation_path
        @workflow_id = workflow_id
        @parameters = parameters
        @request_body = request_body
        @success_criteria = success_criteria
        @on_success = on_success
        @on_failure = on_failure
        @outputs = outputs
      end

      def self.from_hash(hash)
        Step.new(
          step_id: hash[:stepId],
          description: hash[:description],
          operation_id: hash[:operationId],
          operation_path: hash[:operationPath],
          workflow_id: hash[:workflowId],
          parameters: hash[:parameters]&.map { |param| Parameter.from_hash(param) } || [],
          request_body: hash[:requestBody] ? RequestBody.from_hash(hash[:requestBody]) : nil,
          success_criteria: hash[:successCriteria]&.map { |crit| Criterion.from_hash(crit) } || [],
          on_success: hash[:onSuccess]&.map { |sa| SuccessAction.from_hash(sa) } || [],
          on_failure: hash[:onFailure]&.map { |fa| FailureAction.from_hash(fa) } || [],
          outputs: hash[:outputs] || []
        )
      end
    end
  end
end
