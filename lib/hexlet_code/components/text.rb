# frozen_string_literal: true

module HexletCode
  class Text < Base
    def default_attributes
      { cols: 20, rows: 40 }
    end

    def single?
      false
    end

    def data
      {
        html_name: 'textarea',
        name: @name,
        value: @value,
        **@attributes
      }
    end
  end
end
