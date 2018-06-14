# frozen_string_literal: true

require 'cfdi/sat/parser/version'
require 'cfdi/sat/parser/node'
require 'cfdi/sat/parser/invoice_xml_v33'
require 'cfdi/sat/parser/issuer_xml_v33'
require 'nokogiri'
require 'bigdecimal'

module Cfdi
  module Sat
    # Parase el XML del cfdi a un Hash
    module Parser
      def self.run(xml); end
    end
  end
end
