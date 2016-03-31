require File.dirname(__FILE__) + '/../test_helper'

class TechTest < Test::Unit::TestCase
  fixtures :teches

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Tech, teches(:first)
  end
end
