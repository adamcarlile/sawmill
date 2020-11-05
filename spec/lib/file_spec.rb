RSpec.describe Sawmill::File do
  let(:lines) { ["/home 192.168.1.175"] }
  let(:io)    { StringIO.new(lines.join("\n")) }

  subject { described_class.new(io) }

  context "With valid input" do
    it { expect(subject.lines.count).to eql(lines.count) }
    it { expect(subject.lines.first).to be_kind_of Sawmill::Page }
  end

  context "with multiple visits for one page" do
    let(:lines) { ["/home 192.168.1.175", "/home 192.168.1.125" ] }

    it { expect(subject.lines.count).to eql(1) }
  end

end
