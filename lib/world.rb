# frozen_string_literal: true

class World
  
  def initialize(grid_size:)
    @grid_size = grid_size 
  end
  
  def grid
    { m: sizes.first.to_i, n: sizes.last.to_i }
  end
  
  private 
  attr_reader :grid_size

  def sizes
    grid_size.split(' ')
  end
end