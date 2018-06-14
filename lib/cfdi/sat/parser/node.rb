# frozen_string_literal: true

module Cfdi
  module Sat
    module Parser
      # Representa cada nodo del XML, contiene los métodos
      # necesarios para hacer parsig del XML.
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

        def method_missing(method, *_args)
          # Cheaca los hasehs para saber que atributo consultar
          if attr.keys.include? method
            @element.attr(attr[method])
          elsif attr_money.keys.include? method
            return if @element.attr(attr_money[method]).nil?
            # Si el atributo es monetario, conviertelo a centavos
            (BigDecimal(@element.attr(attr_money[method])) * 100).to_i
          else
            super
          end
        end

        def respond_to_missing?(method)
          (attr.keys + attr_money.keys).include?(method) || super
        end

        # Los siguientes métodos seran sobreescritos en las clases
        # hijas.

        # Para los atributos del nodo.
        def attr
          {}
        end

        # Para los atributos monetarios
        def attr_money
          {}
        end

        # Para los nodos hijos.
        def children
          []
        end
      end
    end
  end
end
