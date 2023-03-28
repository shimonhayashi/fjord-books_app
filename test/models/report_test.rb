# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    report = reports(:alice)
    alice = users(:alice)
    bob = users(:bob)

    assert report.editable?(alice)
    assert_not report.editable?(bob)
  end

  test '#created_on' do
    report = reports(:alice)
    assert_equal Date.current, report.created_on
  end
end
