# frozen_string_literal: true

module Cfdi
  module Sat
    module Parser
      # This class maps attributes and children elements from
      # "TimbreFiscalDigital" element.
      class InvoiceXmlV33 < Node
        # This constructor receives the SAT XML as a string and initializes a
        # Nokogiri::XML object in order to read each element and attribute.
        # * *Arguments*    :
        #   - sat_xml
        # * *Returns* :
        #   - none
        def initialize(sat_xml)
          @sat_xml = sat_xml
          @element ||= Nokogiri::XML(@sat_xml).at_xpath(
            "//*[local-name()='Comprobante']"
          )
        end

        # This method returns the exchange rate as a Float value.
        def exchange_rate
          rate = begin
                  Float(@element.attr('TipoCambio'))
                rescue
                  nil
                end
          return rate if rate
          1
        end

        # The following methods come from the parent class InvoiceXml,
        # and are overridden.

        # This method sets "Comprobante" attributes and return a hash with its
        # corresponding key-value.
        # * *Arguments*    :
        #   - none
        # * *Returns* :
        #   - Hash
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

        # This method sets "Comprobante" money attributes which are then multiplied
        # by 100 in order to convert money value to cents in parent class
        # (XmlNode) and are returned as a hash.
        # * *Arguments*    :
        #   - none
        # * *Returns* :
        #   - Hash
        def attr_money
          {
            subtotal_cents: 'SubTotal',
            total_cents: 'Total',
            discount_cents: 'Descuento'
          }
        end
      end
    end
  end
end
