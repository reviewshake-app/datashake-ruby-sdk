# frozen_string_literal: true

module Datashake
  module ReviewIndex
    class V1
      class BaseEndpoint
        def self.request_parameters(request_parameters)
          request_parameters.each do |param_name|
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

          response_class.new(response)
        end

        def response_class
          raise NotImplementedError, "Implement it in a successor class"
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
