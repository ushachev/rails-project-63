# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(model, attributes)
      @model = model
      @attributes = { action: attributes.fetch(:url, '#'), method: 'post' }.merge attributes.except(:url)
      @components = []
    end

    def input(name, attributes = {})
      value = @model.public_send(name) || ''
      @components << { tag: 'input', name:, type: 'text', value: }.merge(attributes)
    end

    def to_html
      Tag.build 'form', @attributes do
        tags = @components.map { |component| Tag.build component[:tag], component.except(:tag) }
        tags.prepend('').join("\n  ") << "\n" if @components.any?
      end
    end
  end
end
