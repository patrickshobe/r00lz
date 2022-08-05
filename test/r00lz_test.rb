# frozen_string_literal: true

require 'test_helper'

class TedController < R00lz::Controller
  def think
    'Whoah, man...'
  end
end

class R00lzTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::R00lz::VERSION
  end

  def test_app_return_success
    env = { 'PATH_INFO' => '/ted/think',
            'QUERY_STRING' => '' }
    assert_equal 200, ::R00lz::App.new.call(env)[0]
  end
end
