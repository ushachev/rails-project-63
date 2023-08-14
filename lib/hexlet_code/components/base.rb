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

    def single?
      raise NotImplementedError
    end

    def data
      raise NotImplementedError
    end
  end
end
