# frozen_string_literal: true

require_relative 'world'
require_relative 'robot'
require_relative 'printer'

class Houston

  def initialize(input:)
    @input = input
  end

  def call
    build_world
    move_robots
    output_result
  end

  private

  attr_reader :input

  def build_world 
    @world ||= World.new(grid_size: input.world)
  end

  def robots
    @robots ||= input.robots.map do |robot|
      Robot.new(coordinates: robot.coordinates, action: robot.action)
    end
  end

  def move_robots
    robots.each(&method(:move_robot))
  end

  def move_robot(robot)
    robot.follow_command(@world.grid)
  end

  def output_result
    robots.each(&method(:print_robot))
  end

  def print_robot(robot)
    Printer.new(robot: robot).print
  end

end