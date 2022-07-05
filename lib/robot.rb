# frozen_string_literal: true

require_relative 'move'
require_relative 'move_validator'

class Robot
    LOST_STATE = 'LOST'

  def initialize(coordinates:, action:)
    @coordinates = coordinates
    @action = action
    @state = ''
  end

  def get_coordinates
    coordinates
  end

  def get_state 
    state
  end

  def follow_command(grid)
    action.split('').each do |move|
      new_coordinates =  Move.new(coordinates: coordinates.clone, move: move).robot_coordinates
      if robot_outside_grid?(new_coordinates, grid)
        mark_as_lost
        break
      end
      update_coordinates(new_coordinates)
    end
  end 

  private

  attr_reader :coordinates, :action, :state

  def update_coordinates(new_coordinates)
    @coordinates = new_coordinates
  end

  def mark_as_lost
    @state = LOST_STATE
  end

  def robot_outside_grid?(coordinates, grid)
    MoveValidator.new(coordinates: coordinates, grid: grid).robot_outside_grid?
  end

end
