# frozen_string_literal: true

RSpec.describe CfdiSat::V33::TaxDetailXml do
  def tax_detail
    sat_xml = File.read('spec/fixtures/documents/invoices/invoice_v33.xml')

    CfdiSat::V33::TaxDetailXml.new(
      Nokogiri::XML(sat_xml).at_xpath(
        "//*[local-name()='Comprobante']/*[local-name() = 'Impuestos']"
      )
    )
  end

  context 'cfdi 3.3' do
    describe '.parse' do
      it 'returns an hash with required keys-values for "Impuestos" node' do
        result = tax_detail.parse
        expect(result[:retained_taxes_total_cents]).to eq(24_750_000)
        expect(result[:transferred_taxes_total_cents]).to eq(36_000_000)
      end
    end
  end
end
