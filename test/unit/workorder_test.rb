require File.dirname(__FILE__) + '/../test_helper'

class WorkorderTest < Test::Unit::TestCase
  fixtures :workorders

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Workorder, workorders(:first)
  end
end
