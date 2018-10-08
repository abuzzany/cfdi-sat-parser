# frozen_string_literal: true

RSpec.describe CfdiSat::V33::RecipientXml do
  def recipient_xml
    sat_xml = File.read('spec/fixtures/documents/invoices/invoice_v33.xml')

    CfdiSat::V33::RecipientXml.new(
      Nokogiri::XML(sat_xml).at_xpath(
        "//*[local-name()='Comprobante']"
      ).at_xpath("//*[local-name()='Receptor']")
    )
  end

  context 'cfdi 3.3' do
    describe '.parse' do
      it 'returns an hash with required keys-values for "Receptor" node' do
        result = recipient_xml.parse
        expect(result[:rfc]).to eq('TES0302010011')
        expect(result[:name]).to eq('Evasor Fiscal 2')
        expect(result[:tax_residency]).to eq('MEX')
        expect(result[:entity_register_id]).to eq('0000000000000')
        expect(result[:cfdi_usage]).to eq('G01')
      end
    end
  end
end
