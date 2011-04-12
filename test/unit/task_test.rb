require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  should validate_presence_of(:title)

  should "validate inclusion of" do
    assert !Task.make_unsaved(:estimated_length => 6).valid?
    assert !Task.make_unsaved(:estimated_length => 0).valid?
    assert_valid Task.make_unsaved(:estimated_length => 1)
    assert_valid Task.make_unsaved(:estimated_length => 4)
  end
end
