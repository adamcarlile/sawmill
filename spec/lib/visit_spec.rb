RSpec.describe Sawmill::Visit do
  let(:ip) { Faker::Internet.ip_v4_address }

  subject { described_class.new(ip: ip) }

  context "with an IP address" do
    it { expect(subject.ip).to eql(ip) }
  end

  context "equality" do
    let(:second_ip)    { ip }
    let(:second_visit) { described_class.new(ip: second_ip) }

    context "with the same IP" do
      it { expect(subject).to eql(second_visit) }
    end

    context "with a different IP" do
      let(:second_ip) { Faker::Internet.ip_v4_address}

      it { expect(subject).not_to eql(second_visit) }
    end
  end

end
