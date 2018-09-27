require "factory_bot_variants/variant_attributes"

RSpec.describe FactoryBotVariants::VariantAttributes, "::map" do
  it "supports symbol keys" do
    variants = described_class.map({ ages: [1, 10, 20] })

    expect(variants).to eq [{ age: 1 }, { age: 10 }, { age: 20 }]
  end

  it "supports string keys" do
    variants = described_class.map({ "ages" => [1, 10, 20] })

    expect(variants).to eq [{ age: 1 }, { age: 10 }, { age: 20 }]
  end
end
