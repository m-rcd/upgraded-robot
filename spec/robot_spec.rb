# frozen_string_literal: true

require './lib/robot'

describe Robot do
  subject { described_class.new(coordinates: coordinates, action: action) }

  let(:coordinates) { { x: 2, y: 3, orientation: 'E' } }
  let(:action) { 'LFRFF' }

  context '#get_coordinates' do 
    it 'returns the coordinates' do 
      expect(subject.get_coordinates).to eq(coordinates)
    end
  end

  context '#get_state' do 
    it 'returns the state' do 
      expect(subject.get_state).to eq('')
    end
  end

  context '#follow_command' do
    context 'when inside the grid' do 
      it 'updates the coordinates' do 
        subject.follow_command({ m: 4, n: 8 })

        expect(subject.get_coordinates).to eq({ x: 4, y: 4, orientation: 'E' })
      end
    end

    context 'when outside the grid' do 
      let(:coordinates) { { x: 0, y: 2, orientation: 'N' } }
      let(:action) { 'FFLFRFF' }

      it 'updates the coordinates and state' do 
        subject.follow_command({ m: 4, n: 8 })

        expect(subject.get_coordinates).to eq({ x: 0, y: 4, orientation: 'W' })
        expect(subject.get_state).to eq('LOST')
      end
    end
  end
  
end 