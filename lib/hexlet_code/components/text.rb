# frozen_string_literal: true

module HexletCode
  class Text
    def initialize(name:, value:, **attributes)
      defaults_attributes = { cols: 20, rows: 40 }
      @name = name
      @value = value
      @attributes = defaults_attributes.merge attributes
    end

    def to_html
      Tag.build('textarea', name: @name, **@attributes) { @value }
    end
  end
end
