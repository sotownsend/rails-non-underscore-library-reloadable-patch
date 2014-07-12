require 'abstract_unit'
require 'active_support/core_ext/object/json'

# When the first test case executes (during the isolated run on travis),
# `active_support/json/encoding` is not yet loaded. This is intended to help
# catch cases where we are incorrectly depending on things defined in that file
# before triggering its autoload. (See #16131 for an example.)

class JsonAutoloadTest < ActiveSupport::TestCase
  def test_time_as_json
    assert_instance_of String, Time.new.as_json
  end

  def test_date_as_json
    assert_instance_of String, Date.new.as_json
  end

  def test_datetime_as_json
    assert_instance_of String, DateTime.new.as_json
  end
end
