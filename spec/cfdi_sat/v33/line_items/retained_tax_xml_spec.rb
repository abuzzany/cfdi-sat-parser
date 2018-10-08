# frozen_string_literal: true

RSpec.describe CfdiSat::V33::LineIntems::RetainedTaxXml do
  def retained_tax
    sat_xml = File.read('spec/fixtures/documents/invoices/invoice_v33.xml')

    CfdiSat::V33::LineIntems::RetainedTaxXml.new(
      Nokogiri::XML(sat_xml).at_xpath(
        "//*[local-name()='Comprobante']"
      ).at_xpath(
        "//*[local-name()='Conceptos']"
      ).at_xpath(
        "//*[local-name()='Concepto']"
      ).at_xpath(
        "//*[local-name()='Impuestos']"
      ).at_xpath(
        "//*[local-name()='Retenciones']"
      ).at_xpath(
        "//*[local-name()='Retencion']"
      )
    )
  end

  context 'cfdi 3.3' do
    describe '.parse' do
      it 'returns an hash with required keys-values for "Conceptos" node' do
        result = retained_tax.parse

        expect(result[:tax_name]).to eq('002')
        expect(result[:rate]).to eq('0.530000')
        expect(result[:factory_type]).to eq('Tasa')
        expect(result[:base]).to eq('2250000')
        expect(result[:amount_cents]).to eq(24_750_000)
      end
    end
  end
end
