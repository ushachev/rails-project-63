# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'

  def self.form_for(_model, attributes = {})
    action = attributes.fetch(:url, '#')
    method = attributes.fetch(:method, 'post')

    Tag.build 'form', action:, method:
  end
end
