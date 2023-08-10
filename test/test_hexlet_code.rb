# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_empty_form_with_default_attributes_is_generated
    user = User.new name: 'Rob'
    expected = '<form action="#" method="post"></form>'
    actual = HexletCode.form_for user do |_f|
      'nothing'
    end

    assert_equal expected, actual
  end

  def test_empty_form_is_generated
    user = User.new name: 'Rob'
    expected = '<form action="/users" method="post"></form>'
    actual = HexletCode.form_for user, url: '/users' do |_f|
      'nothing'
    end

    assert_equal expected, actual
  end
end
