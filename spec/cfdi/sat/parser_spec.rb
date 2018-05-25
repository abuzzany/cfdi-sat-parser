RSpec.describe Cfdi::Sat::Parser do
  it "has a version number" do
    expect(Cfdi::Sat::Parser::VERSION).not_to be nil
  end

  describe '#run' do
    it 'should returns a hash' do
      xml = 'factura patito'
      Cfdi::Sat::Parser.run(xml)
    end
  end
end
