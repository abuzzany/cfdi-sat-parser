# frozen_string_literal: true

module CfdiSat
  module V33
    # Esta clase mapea los atributos del nodo
    # 'Complemento#TimbreFiscalDigital' y los devuelve en forma de Hash.
    class DigitalTaxStampXml < Node
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
