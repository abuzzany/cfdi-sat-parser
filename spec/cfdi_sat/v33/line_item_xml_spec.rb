# frozen_string_literal: true

RSpec.describe CfdiSat::V33::LineItemXml do
  def line_item
    sat_xml = File.read('spec/fixtures/documents/invoices/invoice_v33.xml')

    CfdiSat::V33::LineItemXml.new(
      Nokogiri::XML(sat_xml).at_xpath(
        "//*[local-name()='Comprobante']"
      ).at_xpath(
        "//*[local-name()='Conceptos']"
      ).at_xpath(
        "//*[local-name()='Concepto']"
      )
    )
  end

  context 'cfdi 3.3' do
    describe '.parse' do
      it 'returns an hash with required keys-values for "Conceptos" node' do
        result = line_item.parse

        expected_line_item = { quantity: '2.0',
                               unit_type: 'TONELADA',
                               description: 'ACERO',
                               identify_num: '00001',
                               unity_code: 'F51',
                               product_service_code: '01010101',
                               unit_price_cents: 150_000_000,
                               total_cents: 225_000_000,
                               discount_cents: nil }

        expect(result).to be_eql(expected_line_item)
      end
    end
  end
end
