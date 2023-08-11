# frozen_string_literal: true

module HexletCode
  class FormBuilder
    def initialize(model, attributes)
      @model = model
      @attributes = { action: attributes.fetch(:url, '#'), method: 'post' }.merge attributes.except(:url)
      @components = []
    end

    # def input(field, attributes = {})

    # end

    def to_html
      Tag.build 'form', @attributes do
        @components.map do |component|

        end.join  
      end
    end
  end
end
