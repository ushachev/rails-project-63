# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_empty_form_with_default_attributes_is_generated
    user = User.new name: 'Rob'
    actual = HexletCode.form_for user do |_f|
      'nothing'
    end

    assert_equal load_fixture('empty_default_form.html'), actual
  end

  def test_empty_form_is_generated
    user = User.new name: 'Rob'
    actual = HexletCode.form_for user, url: '/users' do |_f|
      'nothing'
    end

    assert_equal load_fixture('empty_form.html'), actual
  end

  def test_error_is_raised_for_absent_field
    user = User.new name: 'Rob'
    assert_raises NoMethodError do
      HexletCode.form_for user do |f|
        f.input :name
        f.input :age
      end
    end
  end

  def test_default_form_is_generated
    user = User.new name: 'Rob', job: 'Hexlet'
    actual = HexletCode.form_for user, url: '/users' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end

    assert_equal load_fixture('default_form.html'), actual
  end

  def test_form_with_different_inputs_is_generated
    user = User.new name: 'Rob', job: 'Hexlet'
    actual = HexletCode.form_for user, url: '/users' do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal load_fixture('form_with_different_inputs.html'), actual
  end

  def test_form_with_custom_input_attrs_is_generated
    user = User.new name: 'Rob', job: 'Hexlet'
    actual = HexletCode.form_for user, url: '/users' do |f|
      f.input :name
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert_equal load_fixture('form_with_custom_input_attrs.html'), actual
  end
end
