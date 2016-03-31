require File.dirname(__FILE__) + '/../test_helper'

class TechnicianTest < Test::Unit::TestCase
  fixtures :technicians

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Technician, technicians(:first)
  end
end
