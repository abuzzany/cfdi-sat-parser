# frozen_string_literal: true

RSpec.describe CfdiSat::V33::Parser do
  describe '.run' do
    it 'should returns a hash' do
      xml = 'factura patito'
      CfdiSat::V33::Parser.run(xml)
    end
  end
end
