module FactoryBotVariants
  class VariantAttributes
    def self.map(attributes)
      variants = []

      common_attributes = attributes.delete(:all)

      attributes.each do |attr_name, attr_values|
        singular_attr_name = Inflector.singularize(attr_name.to_s).to_sym

        attr_values.each_with_index do |attr_value, index|
          variants[index] ||= {}
          variants[index][singular_attr_name] = attr_value
        end
      end

      if common_attributes
        variants.each { |variant| variant.merge!(common_attributes) }
      end

      variants
    end
  end
end
