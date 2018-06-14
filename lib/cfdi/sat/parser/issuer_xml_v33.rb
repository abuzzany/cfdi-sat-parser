# frozen_string_literal: true

module Cfdi
  module Sat
    module Parser
      # This class maps attributes and children elements from the "Emisor"
      # element.
      class IssuerXmlV33 < Node
        private

        # The following methods come from the parent class InvoiceXml,
        # and are overridden.

        # This method sets "Emisor" attributes and returns a hash with its
        # corresponding key-value.
        # * *Arguments*    :
        #   - none
        # * *Returns* :
        #   - Hash
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
