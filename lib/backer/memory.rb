require "backer/memory/version"

module Backer
  module Memory
    class Base
      def initialize
        @records = {}
        @id = 1
      end

      def self.model_class(model)
        define_method(:model_class) do
          instance_variable_set(:@model_class, model)
        end
      end

      def new(attributes = {})
        model_class.new(attributes)
      end

      def save(object)
        object.id = @id
        @records[@id] = object
        @id += 1
        return object
      end

      def find_by_id(n)
        @records[n.to_i]
      end
    end
  end
end
