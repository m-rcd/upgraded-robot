# frozen_string_literal: true

require './lib/printer'
require 'ostruct'

describe Printer do
  subject { described_class.new(robot: robot).print }

  let(:robot) do 
   OpenStruct.new(
     get_coordinates: { x: 2, y: 3, orientation: 'E' },
     get_state: state
   )
  end

   context 'when robot is not lost' do 
     let(:state) { '' }
     
     it 'returns the coordinates of the robot' do 
        expect { subject }.to output("(2, 3, E) \n").to_stdout
     end
   end

   context 'when robot is lost' do 
    let(:state) { 'LOST' }

    it 'returns the coordinates of the robot' do 
       expect { subject }.to output("(2, 3, E) LOST\n").to_stdout
    end
  end
end 