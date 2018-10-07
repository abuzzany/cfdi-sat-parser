# frozen_string_literal: true

RSpec.describe CfdiSat::V33::Parser do
  it 'has a version number' do
    expect(CfdiSat::VERSION).not_to be nil
  end

  describe '.run' do
    it 'should returns a hash' do
      xml = 'factura patito'
      CfdiSat::V33::Parser.run(xml)
    end
  end
end
