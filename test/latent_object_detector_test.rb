require 'test_helper'

class UserExample
  def foo;end
  def bar;end
  def baz;end
  def foo_bar;end
end

class LatentObjectDetectorTest < MiniTest::Unit::TestCase
  def setup
    @detector = LatentObjectDetector::Detector.for(UserExample)
  end

  def test_for_returns_klass
    assert_kind_of LatentObjectDetector::Detector, @detector
  end

  def test_potential_objects
    assert_equal ["foo", "bar"], @detector.potential_objects
  end

  def test_suspicious_methods
    assert_equal [:foo, :bar, :foo_bar], @detector.suspicious_methods
  end
end