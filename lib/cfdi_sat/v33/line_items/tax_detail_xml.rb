# frozen_string_literal: true

module CfdiSat
  module V33
    module LineIntems
      # Esta clase mapea los atributos del nodo 'Concepto#Impuestos'
      # y los devuelve en forma de Hash.
      class TaxDetailXml < CfdiSat::V33::Node
        # Regresa el nodo 'Concepto#Impuestos#Retenciones' del CFDI.
        def retained_taxes
          @retained_taxes ||= @element.xpath(
            'cfdi:Retenciones'
          )&.xpath('cfdi:Retencion')&.map do |retained_tax|
            RetainedTaxXml.new(retained_tax)
          end
        end

        # Regresa el nodo 'Concepto#Imopuestos#Traslados' del CFDI.
        def transferred_taxes
          @transferred_taxes ||= @element.xpath(
            'cfdi:Traslados'
          )&.xpath('cfdi:Traslado')&.map do |transferred_tax|
            TransferredTaxXml.new(transferred_tax)
          end
        end

        private

        # Mapea los nodos hijos que se tiene que parsear en el nodo
        # 'Concepto#Impuestos' y que regresan un conjunto de nodos.
        def grand_children
          %i[retained_taxes transferred_taxes]
        end
      end
    end
  end
end
