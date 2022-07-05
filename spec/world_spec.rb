# frozen_string_literal: true

require './lib/world'

describe World do
  subject { described_class.new(grid_size: '4 8') }

  it 'returns a hash with grid size' do 
    expect(subject.grid).to eq({ m: 4, n: 8})
  end
end