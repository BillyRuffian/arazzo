# frozen_string_literal: true

require 'json-schema'
require 'semverse'

require_relative 'arazzo/document'
require_relative 'arazzo/document/components'
require_relative 'arazzo/document/criterion'
require_relative 'arazzo/document/failure_action'
require_relative 'arazzo/document/info'
require_relative 'arazzo/document/json_schema'
require_relative 'arazzo/document/parameter'
require_relative 'arazzo/document/replacement'
require_relative 'arazzo/document/request_body'
require_relative 'arazzo/document/source_description'
require_relative 'arazzo/document/step'
require_relative 'arazzo/document/success_action'
require_relative 'arazzo/document/workflow'

require_relative 'arazzo/parser'
require_relative 'arazzo/version'

require 'json'
require 'yaml'

module Arazzo
  extend Arazzo::Parser
  class Error < StandardError; end
  # Your code goes here...
end
