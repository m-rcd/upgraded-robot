# frozen_string_literal: true

class MoveValidator
  def initialize(coordinates:, grid:)
    @coordinates = coordinates
    @grid = grid
  end

  def robot_outside_grid?
    x_out?(coordinates[:x]) || y_out?(coordinates[:y])
  end

  private
  attr_reader :coordinates, :grid 

  def x_out?(coord)
    coord > grid[:m] || coord.negative?
  end

  def y_out?(coord)
    coord > grid[:n] || coord.negative?
  end
end