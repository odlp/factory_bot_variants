require "factory_bot"
require "factory_bot_variants/dsl"

RSpec.describe FactoryBotVariants::DSL do
  let(:klass) do
    Class.new { include FactoryBotVariants::DSL }
  end

  describe "#build_variants" do
    it "uses the build strategy" do
      allow(::FactoryBot).to receive(:build)

      klass.new.build_variants(:dog, names: ["Fido", "Spot"])

      expect(::FactoryBot).to have_received(:build)
        .with(:dog, { "name" => "Fido" })
        .with(:dog, { "name" => "Spot" })
    end
  end

  describe "#create_variants" do
    it "uses the create strategy" do
      allow(::FactoryBot).to receive(:create)

      klass.new.create_variants(:dog, names: ["Fido", "Spot"])

      expect(::FactoryBot).to have_received(:create)
        .with(:dog, { "name" => "Fido" })
        .with(:dog, { "name" => "Spot" })
    end
  end

  describe "#attributes_for_variants" do
    it "uses the attributes_for strategy" do
      allow(::FactoryBot).to receive(:attributes_for)

      klass.new.attributes_for_variants(:dog, names: ["Fido", "Spot"])

      expect(::FactoryBot).to have_received(:attributes_for)
        .with(:dog, { "name" => "Fido" })
        .with(:dog, { "name" => "Spot" })
    end
  end

  describe "#build_stubbed_variants" do
    it "uses the build_stubbed strategy" do
      allow(::FactoryBot).to receive(:build_stubbed)

      klass.new.build_stubbed_variants(:dog, names: ["Fido", "Spot"])

      expect(::FactoryBot).to have_received(:build_stubbed)
        .with(:dog, { "name" => "Fido" })
        .with(:dog, { "name" => "Spot" })
    end
  end
end
