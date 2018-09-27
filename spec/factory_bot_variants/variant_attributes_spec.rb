require "factory_bot_variants/variant_attributes"
require "factory_bot_variants/inflector"

RSpec.describe FactoryBotVariants::VariantAttributes, "::map" do
  it "supports symbol keys" do
    variants = described_class.map({ ages: [1, 10, 20] })

    expect(variants).to eq [{ age: 1 }, { age: 10 }, { age: 20 }]
  end

  it "supports string keys" do
    variants = described_class.map({ "ages" => [1, 10, 20] })

    expect(variants).to eq [{ age: 1 }, { age: 10 }, { age: 20 }]
  end

  it "support singular keys" do
    expect(described_class.map(age: [1, 10, 20])).
      to eq(described_class.map(ages: [1, 10, 20]))
  end

  describe "converting attribute names from plural to singular" do
    it "uses the inflector" do
      allow(FactoryBotVariants::Inflector)
        .to receive(:singularize).and_return(:octopus)

      variants = described_class.map({ octopi: ["Inky", "Bubbles"] })

      expect(variants.first.keys).to contain_exactly :octopus
      expect(FactoryBotVariants::Inflector)
        .to have_received(:singularize).with("octopi")
    end
  end
end
