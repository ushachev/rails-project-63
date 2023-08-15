# frozen_string_literal: true

module HexletCode
  class Label < Base
    def default_attributes
      {}
    end

    def single?
      false
    end

    def data
      {
        html_name: 'label',
        for: @attributes[:for],
        value: @value
      }
    end
  end
end
