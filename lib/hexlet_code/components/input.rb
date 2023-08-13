# frozen_string_literal: true

module HexletCode
  class Input < Base
    def default_attributes
      { type: 'text' }
    end

    def to_html
      Tag.build 'input', name: @name,
                         type: @attributes[:type],
                         value: @value,
                         **@attributes.except(:type)
    end
  end
end
