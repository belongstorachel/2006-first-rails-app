require File.dirname(__FILE__) + '/../test_helper'

class TechsTest < Test::Unit::TestCase
  fixtures :techs

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Techs, techs(:first)
  end
end
