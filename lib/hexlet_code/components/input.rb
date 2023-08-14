# frozen_string_literal: true

module HexletCode
  class Input < Base
    def default_attributes
      { type: 'text' }
    end

    def single?
      true
    end

    def data
      {
        html_name: 'input',
        name: @name,
        type: @attributes[:type],
        value: @value,
        **@attributes.except(:type)
      }
    end
  end
end
