# frozen_string_literal: true

class Move

  POINTS = { N: 0, E: 1, S: 2, W: 3 }.freeze
  ACTION = { 'L' => :left, 'R' => :right, 'F' => :forward }.freeze
  FORWARD = { 0 => :increment_y, 1 => :increment_x, 2 => :decrement_y, 3 => :decrement_x }.freeze
  private_constant :POINTS, :ACTION, :FORWARD

  def initialize(coordinates:, move:)
    @coordinates = coordinates
    @move = move
    @direction = POINTS[coordinates[:orientation].to_sym]
  end

  def robot_coordinates 
    move_robot
    
    coordinates
  end

  private
  attr_reader :coordinates, :move, :direction

  def move_robot
    send(ACTION.fetch(move))
  end

  def right
    @direction += 1
    @direction = 0 if direction == 4
    cardinal_reset
  end

  def left
    @direction -= 1
    @direction = 3 if direction == -1
    cardinal_reset
  end

  def forward
    send(FORWARD.fetch(@direction))
  end

  def increment_x
    coordinates[:x] += 1
  end

  def increment_y
    coordinates[:y] += 1
  end

  def decrement_x 
    coordinates[:x] -= 1
  end

  def decrement_y 
    coordinates[:x] -= 1
  end

  def cardinal_reset
    POINTS.each do |k, v|
      coordinates[:orientation] = k.to_s if direction == v
    end
  end
end