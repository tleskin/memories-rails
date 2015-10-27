require 'test_helper'

class MomentTest < ActiveSupport::TestCase
  test 'should not save a moment without happened_at' do
    moment = Fabricate(:moment)
    moment.happened_at = nil

    assert_not moment.save
  end

  test "memory method returns an array with one instance" do
    moment = Fabricate(:moment)

    assert_equal 1, Moment.past_memory.length
  end

  test "past_memory method returns an array with two instances" do
    moment = Fabricate(:moment)
    moment1 = Fabricate(:moment)

    assert_equal 2, Moment.past_memory.length
  end

  test "past_memory method returns an array with three instances" do
    moment0 = Moment.create( content: "Content0",
                            caption: "Caption0",
                            happened_at: "2013-12-25 04:30:50 +0000",
                            location: "Boulder, CO")

    moment1 = Moment.create( content: "Content1",
                            caption: "Caption1",
                            happened_at: "2013-10-12 04:30:50 +0000",
                            location: "Boulder, CO")

    moment2 = Moment.create( content: "Content2",
                            caption: "Caption2",
                            happened_at: "2014-10-12 04:30:50 +0000",
                            location: "Boulder, CO")

    moment3 = Moment.create( content: "Content3",
                            caption: "Caption3",
                            happened_at: "2015-10-12 04:30:50 +0000",
                            location: "Boulder, CO")

    assert_equal 3, Moment.past_memory.length
  end

  test "get_past_moments method returns memory with same location" do
    moment0 = Moment.create( content: "Content0",
                            caption: "Caption0",
                            happened_at: "2013-12-25 04:30:50 +0000",
                            location: "Boulder, CO")

    moment1 = Moment.create( content: "Content1",
                            caption: "Caption1",
                            happened_at: "2013-10-12 04:30:50 +0000",
                            location: "Boulder, CO")

    assert_equal 1, Moment.get_past_moments.length
    assert_equal "Content0", Moment.get_past_moments.first.content
  end

  test "get_past_moments method returns a random memory" do
    moment0 = Moment.create( content: "Content0",
                            caption: "Caption0",
                            happened_at: "2011-12-25 04:30:50 +0000",
                            location: "Boulder, CO")

    moment1 = Moment.create( content: "Content1",
                            caption: "Caption1",
                            happened_at: "2012-10-12 04:30:50 +0000",
                            location: "Denver, CO")

    moment2 = Moment.create( content: "Content3",
                            caption: "Caption3",
                            happened_at: "2015-11-11 04:30:50 +0000",
                            location: "Colorado Springs, CO")

    assert_equal 1, Moment.get_past_moments.length
  end

  test "get_past_moments method returns a memory when there is only one record" do
    moment = Fabricate(:moment)

    assert_equal "First words", Moment.get_past_moments.content
  end

end
