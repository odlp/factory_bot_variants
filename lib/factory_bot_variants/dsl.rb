module FactoryBotVariants
  module DSL
    def build_variants(factory_name, **attributes)
      variants = []

      common_attributes = attributes.delete(:all)

      attributes.each do |attr_name, attr_values|
        singular_attr_name = attr_name.to_s.sub(/s\z/, "")

        attr_values.each_with_index do |attr_value, index|
          variants[index] ||= {}
          variants[index][singular_attr_name] = attr_value
        end
      end

      if common_attributes
        variants.each { |variant| variant.merge!(common_attributes) }
      end

      variants.map do |variant|
        ::FactoryBot.build(factory_name, variant)
      end
    end
  end
end
