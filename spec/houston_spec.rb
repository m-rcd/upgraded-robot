# frozen_string_literal: true

require './lib/houston'
require 'ostruct'

describe Houston do
  subject { described_class.new(input: input).call }

  let(:input) do 
    OpenStruct.new(
      world: '4 8',
      robots: [
        OpenStruct.new(
          coordinates: { x: 2, y: 3, orientation: 'E' },
          action: 'LFRFF'
        ),
        OpenStruct.new(
          coordinates: { x: 0, y: 2, orientation: 'N' },
          action: 'FFLFRFF' 
        )
      ]
    )
  end

  it 'outputs coordinates and states of all rovers' do
    expect { subject }.to output("(4, 4, E) \n(0, 4, W) LOST\n").to_stdout
  end
end

