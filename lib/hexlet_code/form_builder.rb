# frozen_string_literal: true

require 'active_support/inflector'

module HexletCode
  autoload :Base, 'hexlet_code/components/base'
  autoload :Input, 'hexlet_code/components/input'
  autoload :Text, 'hexlet_code/components/text'
  autoload :Label, 'hexlet_code/components/label'

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
      @components.push Label.new(name: nil, value: name.capitalize, for: name),
                       tag_class.new(name:, value:, **attributes.except(:as))
    end

    def submit(value = 'Save', attributes = {})
      @components << Input.new(name: nil, value:, **attributes.merge({ type: 'submit' }))
    end

    def data
      { attributes: @attributes, components: @components }
    end
  end
end
