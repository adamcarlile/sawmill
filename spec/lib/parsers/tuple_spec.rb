RSpec.describe Sawmill::Parsers::Tuple do
  let(:path) { "/#{Faker::Internet.slug}" }
  let(:ip)   { Faker::Internet.ip_v4_address }
  let(:line) { [path, ip].join(' ') }
  subject { described_class.call(line) }

  it { expect(subject[0]).to eql(path) }
  it { expect(subject[1]).to eql(ip) }
end
