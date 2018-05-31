# frozen_string_literal: true

RSpec.describe Cfdi::Sat::Parser::InvoiceXmlV33 do
  def sat_xml
    Cfdi::Sat::Parser::InvoiceXmlV33.new(
      File.read('spec/fixtures/documents/invoices/invoice_v33.xml')
    )
  end

  context 'cfdi 3.3' do
    describe '.parse' do
      it 'returns hash with required keys-values for "Comprobante" node' do
        result =  sat_xml.parse
        expect(result[:version]).to eq('3.3')
        expect(result[:certificate_number]).to eq('00000000000000000000')
        expect(result[:payment_method]).to eq('PUE')
        expect(result[:expedition_location]).to eq('00000')        
        expect(result[:payment_form]).to eq('01')        
        expect(result[:issue_date]).to eq('2017-01-05T09:09:23')        
        expect(result[:stamp]).to eq('CCCCCCDDDDDD111111')        
        expect(result[:subtotal_cents]).to eq(100000)    
        expect(result[:voucher_type]).to eq('I')        
        expect(result[:total_cents]).to eq(150000)    
        expect(result[:currency]).to eq('MXN')    
      end
    end
  end
end
