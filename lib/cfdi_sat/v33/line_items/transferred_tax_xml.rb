# frozen_string_literal: true

module CfdiSat
  module V33
    module LineIntems
      # Esta clase mapea los atributos del nodo
      # 'Concepto#Impuestos#Traslados#Traslado' y los devuelve en forma de Hash.
      class TransferredTaxXml < CfdiSat::V33::Node
        private

        # Los siguientes metodos sobreescriben a su declaracion en la clase
        # padre Node.

        # Mapea los atributos del nodo 'Traslado' a su correspondiente
        # Key en ingles.
        def attr
          {
            tax_name: 'Impuesto',
            rate: 'TasaOCuota',
            factory_type: 'TipoFactor',
            base: 'Base'
          }
        end

        # Mapea los atributos del monetarios nodo 'Traslado'
        # a su correspondienteKey en ingles ademas de ser convertidos
        # a centavos.
        def attr_money
          { amount_cents: 'Importe' }
        end
      end
    end
  end
end
