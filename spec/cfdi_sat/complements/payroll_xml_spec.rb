# frozen_string_literal: true

RSpec.describe CfdiSat::Complements::PayrollXml do
  def payroll
    sat_xml = File.read('spec/fixtures/documents/invoices/payroll_v12.xml')

    CfdiSat::Complements::PayrollXml.new(
      Nokogiri::XML(sat_xml).at_xpath(
        "//*[local-name()='Comprobante']"
      ).at_xpath(
        "//*[local-name()='Complemento']"
      ).at_xpath(
        "//*[local-name()='Nomina']"
      )
    )
  end

  context 'cfdi 3.3' do
    describe '.parse' do
      it 'returns an hash with required keys-values for "Nomina" node' do
        result = payroll.parse
        expect(result[:payment_date]).to eq('2017-01-04')
        expect(result[:starting_payment_period]).to eq('2016-12-26')
        expect(result[:ending_payment_period]).to eq('2017-01-01')
        expect(result[:paid_days]).to eq('7.000')
        expect(result[:payroll_type]).to eq('O')
        expect(result[:perceptions_total_cents]).to eq(215_512)
        expect(result[:deductions_total_cents]).to eq(35_517)
      end
    end
  end
end
