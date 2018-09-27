require "factory_bot_variants/inflector"
require "factory_bot"

RSpec.describe FactoryBotVariants::Inflector, "::singularize" do
  it "uses the ActiveSupport inflector when available" do
    expect(described_class.singularize("octopi")).to eq ("octopus")
  end

  context "without ActiveSupport" do
    it "removes the trailing 's' (!)" do
      string = "sss"

      allow(string).to receive(:respond_to?)
        .with(:singularize).and_return(false)

      expect(described_class.singularize(string)).to eq "ss"
    end
  end
end
