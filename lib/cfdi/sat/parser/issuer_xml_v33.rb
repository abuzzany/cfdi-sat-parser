# frozen_string_literal: true

module Cfdi
  module Sat
    module Parser
      # Esta clase mapea los atributos del nodo 'Emisor'
      # y los devuelve en forma de Hash.
      class IssuerXmlV33 < Node
        private

        # Los siguientes metodos sobreescriben a su declaracion en la clase
        # padre Node.

        # Mapea los atributos del nodo 'Emisor' a su correspondiente
        # Key en ingles.
        def attr
          {
            rfc: 'Rfc',
            name: 'Nombre',
            tax_classification: 'RegimenFiscal'
          }
        end
      end
    end
  end
end
