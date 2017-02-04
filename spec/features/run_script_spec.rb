require 'spec_helper'

describe 'run script' do
  let!(:manager) { Robot::Manager.new }

  it 'run script a' do
    expect(manager.run_script('robot_scripts/a')).to eq('0,1,NORTH')
  end

  it 'run script b' do
    expect(manager.run_script('robot_scripts/b')).to eq('0,0,WEST')
  end

  it 'run script c' do
    expect(manager.run_script('robot_scripts/c')).to eq('3,3,NORTH')
  end

end
