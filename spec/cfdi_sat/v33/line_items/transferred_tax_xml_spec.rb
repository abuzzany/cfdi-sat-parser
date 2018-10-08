# frozen_string_literal: true

RSpec.describe CfdiSat::V33::LineIntems::TransferredTaxXml do
  def transferred_tax
    sat_xml = File.read('spec/fixtures/documents/invoices/invoice_v33.xml')

    CfdiSat::V33::LineIntems::TransferredTaxXml.new(
      Nokogiri::XML(sat_xml).at_xpath(
        "//*[local-name()='Comprobante']"
      ).at_xpath(
        "//*[local-name()='Conceptos']"
      ).at_xpath(
        "//*[local-name()='Concepto']"
      ).at_xpath(
        "//*[local-name()='Impuestos']"
      ).at_xpath(
        "//*[local-name()='Traslados']"
      ).at_xpath(
        "//*[local-name()='Traslado']"
      )
    )
  end

  context 'cfdi 3.3' do
    describe '.parse' do
      it 'returns an hash with required keys-values for "Traslado" node' do
        result = transferred_tax.parse

        expect(result[:tax_name]).to eq('001')
        expect(result[:rate]).to eq('0.160000')
        expect(result[:factory_type]).to eq('Tasa')
        expect(result[:base]).to eq('2250000')
        expect(result[:amount_cents]).to eq(36_000_000)
      end
    end
  end
end
