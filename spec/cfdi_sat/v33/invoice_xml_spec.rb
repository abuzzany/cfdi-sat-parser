# frozen_string_literal: true

RSpec.describe CfdiSat::V33::InvoiceXml do
  def sat_xml
    CfdiSat::V33::InvoiceXml.new(
      File.read('spec/fixtures/documents/invoices/invoice_v33.xml')
    )
  end

  context 'cfdi 3.3' do
    describe '.parse' do
      it 'returns hash with required keys-values for "Comprobante" node' do
        result = sat_xml.parse
        expect(result[:version]).to eq('3.3')
        expect(result[:certificate_number]).to eq('00000000000000000000')
        expect(result[:payment_method]).to eq('PUE')
        expect(result[:expedition_location]).to eq('00000')
        expect(result[:payment_form]).to eq('01')
        expect(result[:issue_date]).to eq('2017-01-05T09:09:23')
        expect(result[:stamp]).to eq('CCCCCCDDDDDD111111')
        expect(result[:subtotal_cents]).to eq(100_000)
        expect(result[:voucher_type]).to eq('I')
        expect(result[:total_cents]).to eq(150_000)
        expect(result[:currency]).to eq('MXN')
      end

      it 'returns an hash with required keys-values for "Emisor" node' do
        result = sat_xml.parse[:issuer]
        expect(result[:rfc]).to eq('TEST010203001')
        expect(result[:name]).to eq('Evasor Fiscal 1')
        expect(result[:tax_classification]).to eq('601')
      end

      it 'returns an hash with required keys-values for "Receptor" node' do
        result = sat_xml.parse[:recipient]
        expect(result[:rfc]).to eq('TES0302010011')
        expect(result[:name]).to eq('Evasor Fiscal 2')
        expect(result[:tax_residency]).to eq('MEX')
        expect(result[:entity_register_id]).to eq('0000000000000')
        expect(result[:cfdi_usage]).to eq('G01')
      end

      it 'returns an hash with required keys-values for "Conceptos" node' do
        result = sat_xml.parse[:line_items]
        expect(result.count).to be_eql(3)

        first_line_item = result.first

        expected_first_line_item = { quantity: '2.0',
                                     unit_type: 'TONELADA',
                                     description: 'ACERO',
                                     identify_num: '00001',
                                     unity_code: 'F51',
                                     product_service_code: '01010101',
                                     unit_price_cents: 150_000_000,
                                     total_cents: 225_000_000,
                                     discount_cents: nil }

        expect(first_line_item).to be_eql(expected_first_line_item)

        second_line_item = result[1]

        expected_second_line_item = { quantity: '1.5',
                                      unit_type: 'TONELADA',
                                      description: 'ALUMINIO',
                                      identify_num: '00002',
                                      product_service_code: '01010102',
                                      unity_code: 'F52',
                                      unit_price_cents: 150_000,
                                      total_cents: 240_000,
                                      discount_cents: nil }

        expect(second_line_item).to be_eql(expected_second_line_item)

        third_line_item = result.last

        expected_third_line_item = { quantity: '1.7',
                                     unit_type: 'TONELADA',
                                     description: 'ZAMAC',
                                     identify_num: '00003',
                                     unity_code: 'F53',
                                     product_service_code: '01010103',
                                     unit_price_cents: 1_000_000,
                                     total_cents: 1_700_000,
                                     discount_cents: nil }

        expect(third_line_item).to be_eql(expected_third_line_item)
      end

      it 'returns an hash with required keys-values for "Impuestos" node' do
        result = sat_xml.parse[:tax_detail]
        expect(result[:retained_taxes_total_cents]).to eq(24_750_000)
        expect(result[:transferred_taxes_total_cents]).to eq(36_000_000)
      end

      it 'returns an hash with required keys-values for "TimbreFiscalDigital" node' do
        result = sat_xml.parse[:digital_tax_stamp]
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
