# frozen_string_literal: true

module HexletCode
  class Base
    def initialize(name:, value:, **attributes)
      @name = name
      @value = value
      @attributes = default_attributes.merge attributes
    end

    def default_attributes
      raise NotImplementedError
    end

    def to_html
      raise NotImplementedError
    end
  end
end
