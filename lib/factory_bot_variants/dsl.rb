require "factory_bot_variants/variant_attributes"

module FactoryBotVariants
  module DSL
    STRATEGIES = [
      :build,
      :create,
      :attributes_for,
      :build_stubbed
    ].freeze

    STRATEGIES.each do |strategy|
      define_method("#{strategy}_variants") do |factory_name, **attributes|
        VariantAttributes.map(attributes).map do |variant_attributes|
          ::FactoryBot.public_send(strategy, factory_name, variant_attributes)
        end
      end
    end
  end
end
