# frozen_string_literal: true

RSpec.describe CfdiSat::V33::LineIntems::TaxDetailXml do
  def tax_detaiil
    sat_xml = File.read('spec/fixtures/documents/invoices/invoice_v33.xml')

    CfdiSat::V33::LineIntems::TaxDetailXml.new(
      Nokogiri::XML(sat_xml).at_xpath(
        "//*[local-name()='Comprobante']"
      ).at_xpath(
        "//*[local-name()='Conceptos']"
      ).at_xpath(
        "//*[local-name()='Concepto']"
      ).at_xpath(
        "//*[local-name()='Impuestos']"
      )
    )
  end

  context 'cfdi 3.3' do
    describe '.parse' do
      it 'returns an hash with required keys-values for "Conceptos" node' do
        result = tax_detaiil.parse
      end
    end
  end
end
