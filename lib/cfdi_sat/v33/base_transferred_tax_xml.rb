# frozen_string_literal: true

module CfdiSat
  module V33
    # Esta clase mapea los atributos comunes para los nodos de tipo 'Traslado'
    # que son multiplemente usados en diferentes variaciones del CFDI
    # y los devuelve en forma de Hash.
    class BaseTransferredTaxXml < CfdiSat::V33::Node
      private

      # Los siguientes metodos sobreescriben a su declaracion en la clase
      # padre Node.

      # Mapea los atributos del nodo 'Traslado' a su correspondiente
      # Key en ingles.
      def attr
        {
          tax_name: 'Impuesto',
          rate: 'TasaOCuota',
          factory_type: 'TipoFactor'
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
