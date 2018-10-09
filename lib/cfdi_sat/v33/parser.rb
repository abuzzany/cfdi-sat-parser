# frozen_string_literal: true

require 'cfdi_sat/v33/node'
require 'cfdi_sat/v33/invoice_xml'
require 'cfdi_sat/v33/issuer_xml'
require 'cfdi_sat/v33/recipient_xml'
require 'cfdi_sat/v33/line_item_xml'
require 'cfdi_sat/v33/tax_detail_xml'
require 'cfdi_sat/v33/transferred_tax_xml'
require 'cfdi_sat/v33/base_retained_tax_xml'
require 'cfdi_sat/v33/retained_tax_xml'
require 'cfdi_sat/v33/line_items/tax_detail_xml'
require 'cfdi_sat/v33/line_items/transferred_tax_xml'
require 'cfdi_sat/v33/line_items/retained_tax_xml'
require 'cfdi_sat/v33/digital_tax_stamp_xml'
require 'nokogiri'
require 'bigdecimal'

module CfdiSat
  module V33
    # Parase el XML del cfdi a un Hash.
    module Parser
      def self.run(xml); end
    end
  end
end
