RSpec.describe Sawmill::Renderers::Text::Line do
  let(:visit_count) { 1 }
  let(:visits)      { visit_count.times.map { Sawmill::Visit.new(ip: Faker::Internet.ip_v4_address) } }
  let(:path)        { "/#{Faker::Internet.slug}" }
  let(:page)        { Sawmill::Page.new(path: path, visits: visits) }

  subject { described_class.new(page) }

  context "Renders out the string" do
    it { expect(subject.to_s).to eql("#{path} #{visit_count} visit") }
      
    context "with several visits should be correctly pluralised" do
      let(:visit_count) { 3 }

      it { expect(subject.to_s).to eql("#{path} #{visit_count} visits") }
    end
  end



end
