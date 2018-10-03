# frozen_string_literal: true

module Cfdi
  module Sat
    module Parser
      # Esta clase mapea los atributos del nodo
      # 'Complemento#TimbreFiscalDigital' y los devuelve en forma de Hash.
      class DigitalTaxStampXmlV33 < Node
        private

          # Los siguientes metodos sobreescriben a su declaracion en la clase
          # padre Node.

          # Mapea los atributos del nodo 'Complemento#TimbreFiscalDigital'
          # a su correspondiente Key en ingles.

          def attr
            {
              version: 'Version',
              uuid: 'UUID',
              issue_date: 'FechaTimbrado',
              certified_sat_number: 'NoCertificadoSAT',
              cfd_reference: 'SelloCFD',
              sat_reference: 'SelloSAT'
            }
          end
      end
    end
  end
end
