# frozen_string_literal: true

module Cfdi
  module Sat
    module Parser
      class Node

        def initialize(element)
          @element = element
        end

        def parse
          element_hash = {}
          (attr.keys + attr_money.keys).each do |key|
            element_hash[key] = send(key)
          end

          children.each do |child|
            element_hash[child] = send(child)&.parse
          end

          element_hash
        end

        private 

        # Override ruby methods.

        # If a method we call is missing, pass the call onto the object we
        # delegate to. We use this method in order to fetch xml attributes from
        # Nokogiri::XML::Element
        def method_missing(method, *_args)
          # Checks the hashes to find the method
          if attr.keys.include? method
            @element.attr(attr[method])
          elsif attr_money.keys.include? method
            return if @element.attr(attr_money[method]).nil?
            # If the method is into attr_money it coverts in cents
            (BigDecimal(@element.attr(attr_money[method])) * 100).to_i
          else
            super
          end
        end

        def respond_to_missing?(method)
          (attr.keys + attr_money.keys).include?(method) || super
        end

        # The next methods will be overridden in children objects and contains the
        # xml element attributes.

        # Returns a hash with corresponding key-value of xml attributes.
        def attr
          {}
        end

        # Returns a hash with corresponding key-value of money type xml attributes.
        def attr_money
          {}
        end

        # This method is used for children methods that returns a Single objects.
        def children
          []
        end
      end
    end
  end
end
