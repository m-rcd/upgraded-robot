# frozen_string_literal: true

require 'mixlib/shellout'

describe 'Running the program from the command line' do
  it 'should print the coordinates and states of all rovers' do
    run = Mixlib::ShellOut.new("./bin/run.rb ./input_1.txt")
    run.run_command
    expect(run.stdout).to eq "(4, 4, E) \n(0, 4, W) LOST\n"
  end
end