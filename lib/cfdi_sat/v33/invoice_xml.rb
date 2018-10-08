# frozen_string_literal: true

module CfdiSat
  module V33
    # Esta clase mapea los atributos y nodos del CFDI version 3.3
    # y los devuelve en forma de Hash.
    class InvoiceXml < Node
      def initialize(sat_xml)
        @sat_xml = sat_xml
        @element ||= Nokogiri::XML(@sat_xml).at_xpath(
          "//*[local-name()='Comprobante']"
        )
      end

      # Regresa el nodo 'Emisor' del CFDI.
      def issuer
        @issuer ||= IssuerXml.new(
          @element.at_xpath("//*[local-name()='Emisor']")
        )
      end

      # Regresa el nodo 'Emisor' del CFDI.
      def recipient
        @recipient ||= RecipientXml.new(
          @element.at_xpath("//*[local-name()='Receptor']")
        )
      end

      # Regresa el nodo 'Conceptos' del CFDI.
      def line_items
        @line_items ||= @element.at_xpath(
          'cfdi:Conceptos'
        )&.xpath('cfdi:Concepto')&.map do |line_item|
          LineItemXml.new(line_item)
        end
      end

      # Regresa el nodo 'Impuestos' del CFDI.
      def tax_detail
        @tax_detail ||= @element.at_xpath(
          "//*[local-name()='Comprobante']/*[local-name() = 'Impuestos']"
        )

        return if @tax_detail.nil?
        TaxDetailXml.new(@tax_detail)
      end

      # Regresa el nodo 'Complemento#TimbreFiscalDigital' del CFDI.
      def digital_tax_stamp
        @digital_tax_stamp ||= @element.at_xpath(
          "//*[local-name()='Complemento']"
        )&.at_xpath("//*[local-name()='TimbreFiscalDigital']")

        return if @digital_tax_stamp.nil?
        DigitalTaxStampXml.new(@digital_tax_stamp)
      end

      private

      # A veces el tipo de cambio no viene en el XML
      # regresamos 1 en caso de que no venga.
      def exchange_rate
        rate = begin
                Float(@element.attr('TipoCambio'))
              rescue
                nil
              end
        return rate if rate
        1
      end

      # Los siguientes metodos sobreescriben a su declaración en la clase
      # padre Node.

      # Mapea los atributos del nodo 'Comprobante' a su correspondiente
      # Key en ingles.
      def attr
        {
          version: 'Version',
          series: 'Serie',
          folio: 'Folio',
          issue_date: 'Fecha',
          stamp: 'Sello',
          payment_form: 'FormaPago',
          certificate_number: 'NoCertificado',
          certificate: 'Certificado',
          discount_reason: 'MotivoDescuento',
          payment_terms: 'CondicionesPago',
          raw_exchange_rate: 'TipoCambio',
          exchange_rate: exchange_rate,
          currency: 'Moneda',
          payment_method: 'MetodoPago',
          last_digits: 'NumCtaPago',
          expedition_location: 'LugarExpedicion',
          tax_folio: 'FolioFiscalOrig',
          tax_serie: 'SerieFolioFiscalOrig',
          voucher_type: 'TipoDeComprobante'
        }
      end

      # Mapea los atributos del monetarios nodo 'Comprobante'
      # a su correspondienteKey en ingles ademas de ser convertidos
      # a centavos.
      def attr_money
        {
          subtotal_cents: 'SubTotal',
          total_cents: 'Total',
          discount_cents: 'Descuento'
        }
      end

      # Mapea los nodos hijos que se tiene que parsear en el nodo
      # 'Comprobante'.
      def children
        %i[issuer recipient tax_detail digital_tax_stamp]
      end

      # Mapea los nodos hijos que se tiene que parsear en el nodo
      # 'Comprobante' y que regresan un conjunto de nodos.
      def grand_children
        %i[line_items]
      end
    end
  end
end
