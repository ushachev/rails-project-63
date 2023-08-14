# frozen_string_literal: true

require 'active_support/inflector'

module HexletCode
  module View
    def self.to_html(form_data)
      tags = form_data[:components].map do |component|
        tag_name = component.data[:html_name]
        attributes = component.data.except(:html_name)

        if component.single?
          Tag.build(tag_name, attributes)
        else
          Tag.build(tag_name, attributes.except(:value)) { attributes[:value] }
        end
      end

      Tag.build('form', form_data[:attributes]) { "\n  #{tags.join("\n  ")}\n" if tags.any? }
    end
  end
end
