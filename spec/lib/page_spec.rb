RSpec.describe Sawmill::Page do
  let(:path)    { URI.parse("/#{Faker::Internet.slug}") }
  let(:visits)  { [] }

  subject { described_class.new(path: path.to_s, visits: visits) }

  context "with a path" do
    it { expect(subject.path).to eql(path) }

    context "and several visits" do
      let(:vist_count)  { 3 }
      let(:visits) { 3.times.map { Sawmill::Visit.new(ip: Faker::Internet.ip_v4_address) } }

      it { expect(subject.count).to eql(vist_count) }

      context "and adding another visit" do
        let(:visit) { Sawmill::Visit.new(ip: Faker::Internet.ip_v4_address) }
        before { subject << visit }

        it { expect(subject.count).to eql(vist_count + 1) }
      end
    end

  end


end
