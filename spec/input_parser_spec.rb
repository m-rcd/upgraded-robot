# frozen_string_literal: true

require './lib/input_parser'

describe InputParser do
  subject { described_class.new('./input_1.txt').data }

  it 'returns a struct' do 
    expect(subject.world).to eq('4 8')
    expect(subject.robots.first.coordinates).to eq({ x: 2, y: 3, orientation: 'E' })
    expect(subject.robots.first.action).to eq('LFRFF')

    expect(subject.robots.last.coordinates).to eq({ x: 0, y: 2, orientation: 'N' })
    expect(subject.robots.last.action).to eq('FFLFRFF')
  end
end