# frozen_string_literal: true

module CfdiSat
  module V33
    # Esta clase mapea los atributos del nodo
    # 'Comprobante#Impuestos#Retenciones#Retencion' y los devuelve en forma
    # de Hash.
    class RetainedTaxXml < CfdiSat::V33::Node
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
