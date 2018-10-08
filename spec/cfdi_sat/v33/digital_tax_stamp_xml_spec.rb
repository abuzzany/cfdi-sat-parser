# frozen_string_literal: true

RSpec.describe CfdiSat::V33::DigitalTaxStampXml do
  def digitalt_tax_stamp
    sat_xml = File.read('spec/fixtures/documents/invoices/invoice_v33.xml')

    CfdiSat::V33::DigitalTaxStampXml.new(
      Nokogiri::XML(sat_xml).at_xpath(
        "//*[local-name()='Complemento']"
      ).at_xpath("//*[local-name()='TimbreFiscalDigital']")
    )
  end

  context 'cfdi 3.3' do
    describe '.parse' do
      it 'returns an hash with required keys-values for "TimbreFiscalDigital" node' do
        result = digitalt_tax_stamp.parse
        expect(result[:version]).to eq('1.1')
        expect(result[:uuid]).to eq('2303A234-B06C-4945-89ED-0DC2CDB31169')
        expect(result[:issue_date]).to eq('2017-01-05T12:39:21')
        expect(result[:certified_sat_number]).to eq('00000000000000000000')
        expect(result[:cfd_reference]).to eq('AAAAABBBBB00000')
        expect(result[:sat_reference]).to eq('CCCCCCDDDDDD111111')
      end
    end
  end
end
