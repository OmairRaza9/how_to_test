require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    sirrobot= Robot.new
    sirrobot.needs_repairs = true
    sirrobot.foreign_model = true

    # act
    expect = 1
    actual = sirrobot.station

    # assert
    assert_equal(expect, actual)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    tworobot = Robot.new
    tworobot.needs_repairs = true
    tworobot.vintage_model = true
    # act
    expect = 2
    actual = tworobot.station
    # assert
    assert_equal(expect, actual)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    drobot = Robot.new
    drobot.needs_repairs = true

    # act
    expect = 3
    actual = drobot.station
    # assert

    assert_equal(expect, actual)
  end

  def test_that_robot_in_good_condition_sent_to_station_4

    # arrange
    pibot = Robot.new

    # act
    actual = 4
    expect = pibot.station
    # assert
    assert_equal(expect, actual)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange
    myrobot = Robot.new

    # act
    expect = -1
    actual = myrobot.prioritize_tasks
    # assert
    assert_equal(expect, actual)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange
    myrobot = Robot.new
    myrobot.todos = [1, 2, 3, 4, 5]
    # act
    expect = 5
    actual = myrobot.prioritize_tasks

    # assert
    assert_equal(expect, actual)
  end

  def test_workday_on_day_off_returns_false

    # arrange
    myrobot = Robot.new
    myrobot.day_off = "saturday"

    # act
    expect = false
    actual = myrobot.workday?("saturday")

    # assert
    assert_equal(expect, actual)
  end

  def test_workday_not_day_off_returns_true

    # arrange
    myrobot = Robot.new
    myrobot.day_off = "saturday"
    # act
    expect = true
    actual = myrobot.workday?("monday")
    # assert
    assert_equal(expect, actual)
  end

end
