require "factory_bot"
require "factory_bot_variants/dsl"

RSpec.describe "FactoryBot variants" do
  include FactoryBotVariants::DSL

  Dog = Struct.new(:name, :age, :cute)

  FactoryBot.define do
    factory :dog do
      name { "Scruffles" }
      age { 1 }
      cute { true }
    end
  end

  it "assigns the attributes to each variant" do
    dog_1, dog_2, dog_3 = build_variants(:dog, names: ["Fido", "Benji", "Spot"])

    expect(dog_1.name).to eq "Fido"
    expect(dog_2.name).to eq "Benji"
    expect(dog_3.name).to eq "Spot"
  end

  it "assigns multiple attributes" do
    dog_1, dog_2 = build_variants(:dog, names: ["Fido", "Benji"], ages: [5, 12])

    expect(dog_1.name).to eq "Fido"
    expect(dog_1.age).to eq 5

    expect(dog_2.name).to eq "Benji"
    expect(dog_2.age).to eq 12
  end

  describe "'all' key" do
    it "assigns the attributes to every variant" do
      dog_1, dog_2 = build_variants(
        :dog, names: ["Brutus", "Avril"], all: { cute: false }
      )

      expect(dog_1.name).to eq "Brutus"
      expect(dog_1.cute).to be false

      expect(dog_2.name).to eq "Avril"
      expect(dog_2.cute).to be false
    end
  end
end
