# frozen_string_literal: true

require 'test_helper'

class TestTag < Minitest::Test
  def test_single_tag
    assert_equal '<br>', HexletCode::Tag.build('br')
    assert_equal '<hr>', HexletCode::Tag.build('hr') { 'hr tag content' }
    assert_equal '<img src="path/to/image">', HexletCode::Tag.build('img', src: 'path/to/image')
    assert_equal '<input type="submit" value="Save">', HexletCode::Tag.build('input', type: 'submit', value: 'Save')
  end

  def test_pair_tag
    assert_equal '<label>Email</label>', HexletCode::Tag.build('label') { 'Email' }
    assert_equal '<label for="email">Email</label>', HexletCode::Tag.build('label', for: 'email') { 'Email' }
    assert_equal '<div></div>', HexletCode::Tag.build('div')
  end
end
