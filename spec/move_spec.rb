# frozen_string_literal: true

require './lib/move'

describe Move do
  subject { described_class.new(coordinates: coordinates, move: move) }

  let(:coordinates) { { x: 2, y: 3, orientation: orientation }}
  let(:orientation) { 'E' }
  
  context 'when move is L' do 
    let(:move) { 'L' }

    it 'returns new coordinates' do 
      expect(subject.robot_coordinates).to eq({ x: 2, y: 3, orientation: 'N' })
    end

    context 'when orientation is N' do 
      let(:orientation) { 'N' }

      it 'returns new coordinates' do 
        expect(subject.robot_coordinates).to eq({ x: 2, y: 3, orientation: 'W' })
      end
    end
  end

  context 'when move is R' do 
    let(:move) { 'R' }

    it 'returns new coordinates' do 
      expect(subject.robot_coordinates).to eq({ x: 2, y: 3, orientation: 'S' })
    end

    context 'when orientation is W' do 
      let(:orientation) { 'W' }

      it 'returns new coordinates' do 
        expect(subject.robot_coordinates).to eq({ x: 2, y: 3, orientation: 'N' })
      end
    end
  end

  context 'when move is F' do 
    let(:move) { 'F' }

    it 'returns new coordinates' do 
      expect(subject.robot_coordinates).to eq({ x: 3, y: 3, orientation: 'E' })
    end
  end
end 
