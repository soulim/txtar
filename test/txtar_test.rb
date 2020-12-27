# frozen_string_literal: true

require "test_helper"
require "txtar"

class TxtarTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Txtar::VERSION
  end
end
