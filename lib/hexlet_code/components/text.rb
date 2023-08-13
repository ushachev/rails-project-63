# frozen_string_literal: true

module HexletCode
  class Text < Base
    def default_attributes
      { cols: 20, rows: 40 }
    end

    def to_html
      Tag.build('textarea', name: @name, **@attributes) { @value }
    end
  end
end
