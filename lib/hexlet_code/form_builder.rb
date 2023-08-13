# frozen_string_literal: true

require 'active_support/inflector'

module HexletCode
  autoload :Input, 'hexlet_code/components/input'

  class FormBuilder
    def initialize(model, attributes)
      @model = model
      @attributes = { action: attributes.fetch(:url, '#'), method: 'post' }.merge attributes.except(:url)
      @components = []
    end

    def input(name, attributes = {})
      value = @model.public_send(name) || ''
      tag = attributes.fetch(:as, :input)
      tag_class = "HexletCode::#{tag.to_s.capitalize}".constantize
      @components << tag_class.new(name:, value:, **attributes.except(:as))
    end

    def to_html
      Tag.build 'form', @attributes do
        tags = @components.map(&:to_html)
        tags.prepend('').join("\n  ") << "\n" if @components.any?
      end
    end
  end
end
