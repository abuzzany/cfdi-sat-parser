# frozen_string_literal: true

module Cfdi
  module Sat
    module Parser
      # Esta clase mapea los atributos del nodo 'Concepto'
      # y los devuelve en forma de Hash.
      class LineItemXmlV33 < Node
        private

        # Los siguientes metodos sobreescriben a su declaracion en la clase
        # padre Node.

        # Mapea los atributos del nodo 'Concepto' a su correspondiente
        # Key en ingles.
        def attr
          {
            quantity: 'Cantidad',
            unit_type: 'Unidad',
            description: 'Descripcion',
            identify_num: 'NoIdentificacion',
            product_service_code: 'ClaveProdServ',
            unity_code: 'ClaveUnidad'
          }
        end

        # Mapea los atributos del monetarios nodo 'Concepto'
        # a su correspondienteKey en ingles ademas de ser convertidos
        # a centavos.
        def attr_money
          {
            unit_price_cents: 'ValorUnitario',
            total_cents: 'Importe',
            discount_cents: 'Descuento'
          }
        end
      end
    end
  end
end
