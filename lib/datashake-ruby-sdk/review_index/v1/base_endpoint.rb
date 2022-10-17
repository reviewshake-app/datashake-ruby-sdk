# frozen_string_literal: true

module Datashake
  module ReviewIndex
    class V1
      class BaseEndpoint
        def self.allow_parameters(allowed_parameters)
          allowed_parameters.each do |param_name|
            define_method(param_name) do |value|
              @params[param_name] = value

              self
            end
          end
        end

        def initialize(version)
          @version = version
          @params = {}
        end

        def fetch
          response = version.fetch(method: :get, path: endpoint_path, params: params)

          Datashake::ReviewIndex::V1::Response.new(response)
        end

        def endpoint_path
          raise NotImplementedError, "Implement it in a successor class"
        end

        private

        attr_reader :version, :params
      end
    end
  end
end
