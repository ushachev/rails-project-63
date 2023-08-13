# frozen_string_literal: true

module HexletCode
  class Input
    def initialize(name:, value:, **attributes)
      defaults_attributes = { type: 'text' }
      @name = name
      @value = value
      @attributes = defaults_attributes.merge attributes
    end

    def to_html
      Tag.build 'input', name: @name, type: @attributes[:type], value: @value, **@attributes.except(:type)
    end
  end
end
