# frozen_string_literal: true

module CfdiSat
  module V33
    # Esta clase mapea los atributos del nodo 'Receptor'
    # y los devuelve en forma de Hash.
    class RecipientXml < Node
      private

        # Los siguientes metodos sobreescriben a su declaracion en la clase
        # padre Node.

        # Mapea los atributos del nodo 'Receptor' a su correspondiente
        # Key en ingles.
        def attr
          {
            rfc: 'Rfc',
            name: 'Nombre',
            tax_residency: 'ResidenciaFiscal',
            entity_register_id: 'NumRegIdTrib',
            cfdi_usage: 'UsoCFDI'
          }
        end
    end
  end
end
