# frozen_string_literal: true

module CfdiSat
  module V33
    # Esta clase mapea los atributos comunes para los nodos de tipo 'Retencion'
    # que son multiplemente usados en diferentes variaciones del CFDI
    # y los devuelve en forma de Hash.
    class BaseRetainedTaxXml < CfdiSat::V33::Node
      private

      # Los siguientes metodos sobreescriben a su declaracion en la clase
      # padre Node.

      # Mapea los atributos del nodo 'Retencion' a su correspondiente
      # Key en ingles.
      def attr
        { tax_name: 'Impuesto' }
      end

      # Mapea los atributos del monetarios nodo 'Retencion'
      # a su correspondienteKey en ingles ademas de ser convertidos.
      def attr_money
        { amount_cents: 'Importe' }
      end
    end
  end
end
