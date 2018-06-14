# frozen_string_literal: true

module Cfdi
  module Sat
    module Parser
      # Esta clase mapea los atributos y nodos del CFDI versión 3.3
      # y los devuelve en forma de Hash.
      class InvoiceXmlV33 < Node
        def initialize(sat_xml)
          @sat_xml = sat_xml
          @element ||= Nokogiri::XML(@sat_xml).at_xpath(
            "//*[local-name()='Comprobante']"
          )
        end

        # Regresa el nodo 'Emisor' del CFDI.
        def issuer
          @issuer ||= IssuerXmlV33.new(
            @element.at_xpath("//*[local-name()='Emisor']")
          )
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

        # Los siguientes métodos sobreescriben a su declaración en la clase
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

        # Mape los nodos hijos que se tiene que parsear en el nodo
        # 'Comporbante'.
        def children
          [:issuer]
        end
      end
    end
  end
end
