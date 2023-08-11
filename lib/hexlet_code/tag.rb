# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build(name, attributes = {})
      attributes_line = attributes.map { |attribute, value| %( #{attribute}="#{value}") }.join

      return "<#{name}#{attributes_line}>" if single?(name)

      "<#{name}#{attributes_line}>#{yield if block_given?}</#{name}>"
    end

    def self.single?(name)
      single_tags = %w[br hr img input]
      single_tags.include?(name)
    end
  end
end
