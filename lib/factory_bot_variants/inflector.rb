module FactoryBotVariants
  module Inflector
    def self.singularize(word)
      if word.respond_to? :singularize
        word.singularize
      else
        word.to_s.sub(/s\z/, "")
      end
    end
  end
end
