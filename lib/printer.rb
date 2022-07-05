# frozen_string_literal: true

class Printer 
  def initialize(robot:)
    @robot = robot 
  end

  def print 
    puts format_coordinates + robot.get_state
  end

  private

  attr_reader :robot 

  def format_coordinates
    "(#{coordinates[:x]}, #{coordinates[:y]}, #{coordinates[:orientation]}) "
  end

  def coordinates
    @coordinates ||= robot.get_coordinates
  end

end 