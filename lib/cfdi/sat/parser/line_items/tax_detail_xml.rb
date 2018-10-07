# frozen_string_literal: true

module Cfdi
  module Sat
    module Parser
      # Esta clase mapea los atributos del nodo 'Concepto#Impuestos'
      # y los devuelve en forma de Hash.
      class TaxDetailXml
        private

        def grand_children
          %i[retained_taxes transferred_taxes]
        end
      end
    end
  end
end
