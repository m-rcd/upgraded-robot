# frozen_string_literal: true

require './lib/move_validator'

describe MoveValidator do
  subject { described_class.new(coordinates: coordinates, grid: grid) }

  let(:grid) { { m: 4, n: 8 } }
  let(:coordinates) { { x: x, y: y } }
  let(:x) { 2 }
  let(:y) { 4 }

  context 'when robot is outside the grid' do 
    context 'when x is out' do 
      let(:x) { 5 }

      it 'returns true' do 
        expect(subject.robot_outside_grid?).to be true
      end
    end

    context 'when x is negative' do 
      let(:x) { -1 }
      
      it 'returns true' do 
        expect(subject.robot_outside_grid?).to be true
      end
    end

    context 'when y is out' do 
      let(:y) { 9 }
      
      it 'returns true' do 
        expect(subject.robot_outside_grid?).to be true
      end
    end
  end

  context 'when y is negative' do 
    let(:y) { -1 }
    
    it 'returns true' do 
      expect(subject.robot_outside_grid?).to be true
    end
  end

  context 'when robot is inside the grid' do
    it 'returns false' do 
      expect(subject.robot_outside_grid?).to be false
    end
  end

end 