# frozen_string_literal: true

class InputParser
  DataStruct = Struct.new(:world, :robots)
  RobotStruct = Struct.new(:coordinates, :action)

  def initialize(file)
    @file = file
  end

  def data 
    DataStruct.new(world, robots)
  end

  private 
  attr_reader :file

  
  def input 
    @input ||= File.readlines(file)
  end 

  def world 
    input.first.strip
  end

  def robots
    input.drop(1).map(&method(:build_robot_struct))
  end

  def build_robot_struct(line)
    split_line = line[1..-1].split(')')

    RobotStruct.new(coordinates(split_line.first), action(split_line.last))
  end

  def coordinates(data)
    split_data = data.split(',')

    { :x => split_data[0].to_i, :y => split_data[1].to_i, :orientation => split_data.last.strip }
  end

  def action(data)
    data.strip
  end
  
end