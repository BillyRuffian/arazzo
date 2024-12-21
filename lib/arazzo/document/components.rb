module Arazzo
  class Document
    class Components
      attr_accessor :inputs, :parameters, :success_actions, :failure_actions

      def initialize(inputs: {}, parameters: {}, success_actions: {}, failure_actions: {})
        @inputs = inputs
        @parameters = parameters
        @success_actions = success_actions
        @failure_actions = failure_actions
      end

      def self.from_hash(hash)
        new(
          inputs: hash[:inputs]&.transform_values { |input| JSONSchema.from_hash(input) } || {},
          parameters: hash[:parameters]&.transform_values { |param| Parameter.from_hash(param) } || {},
          success_actions: hash[:success_actions]&.transform_values { |action| SuccessAction.from_hash(action) } || {},
          failure_actions: hash[:failure_actions]&.transform_values { |action| FailureAction.from_hash(action) } || {}
        )
      end
    end
  end
end
