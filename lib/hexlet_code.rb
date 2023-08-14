# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :View, 'hexlet_code/view'

  def self.form_for(model, attributes = {})
    form_builder = FormBuilder.new(model, attributes)

    yield form_builder if block_given?

    View.to_html form_builder.data
  end
end
