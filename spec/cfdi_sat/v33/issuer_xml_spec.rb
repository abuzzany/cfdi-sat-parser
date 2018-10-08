# frozen_string_literal: true

RSpec.describe CfdiSat::V33::IssuerXml do
  def issuer_xml
    sat_xml = File.read('spec/fixtures/documents/invoices/invoice_v33.xml')

    CfdiSat::V33::IssuerXml.new(
      Nokogiri::XML(sat_xml).at_xpath(
        "//*[local-name()='Comprobante']"
      ).at_xpath("//*[local-name()='Emisor']")
    )
  end

  context 'cfdi 3.3' do
    describe '.parse' do
      it 'returns an hash with required keys-values for "Emisor" node' do        
        result = issuer_xml.parse
        expect(result[:rfc]).to eq('TEST010203001')
        expect(result[:name]).to eq('Evasor Fiscal 1')
        expect(result[:tax_classification]).to eq('601')
      end
    end
  end
end
