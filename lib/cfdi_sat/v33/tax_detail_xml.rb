# frozen_string_literal: true

module CfdiSat
  module V33
    # Esta clase mapea los atributos del nodo 'Comprobante#Impuestos'
    # y los devuelve en forma de Hash.
    class TaxDetailXml < CfdiSat::V33::Node
      # Regresa el nodo 'Comprobante#Impuestos#Retenciones' del CFDI.
      def retained_taxes
        @retained_taxes ||= @element.xpath(
          'cfdi:Retenciones'
        )&.xpath('cfdi:Retencion')&.map do |retained_tax|
          RetainedTaxXml.new(retained_tax)
        end
      end

      # Regresa el nodo 'Comprobante#Imopuestos#Traslados' del CFDI.
      def transferred_taxes
        @transferred_taxes ||= @element.xpath(
          'cfdi:Traslados'
        )&.xpath('cfdi:Traslado')&.map do |transferred_tax|
          TransferredTaxXml.new(transferred_tax)
        end
      end

      private

      # Los siguientes metodos sobreescriben a su declaracion en la clase
      # padre Node.

      # Mapea los atributos del monetarios nodo 'Retencion'
      # a su correspondienteKey en ingles ademas de ser convertidos.
      def attr_money
        {
          retained_taxes_total_cents: 'TotalImpuestosRetenidos',
          transferred_taxes_total_cents: 'TotalImpuestosTrasladados'
        }
      end

      # Mapea los nodos hijos que se tiene que parsear en el nodo
      # 'Comprobante#Impuestos' y que regresan un conjunto de nodos.
      def grand_children
        %i[retained_taxes transferred_taxes]
      end
    end
  end
end
