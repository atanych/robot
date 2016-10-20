require 'spec_helper'

describe Robot::Manager do
  let!(:manager) { Robot::Manager.new }

  describe '#run_script' do
    describe 'add correct script path' do
      it 'passes without any errors' do
        manager.run_script('robot_scripts/a')
      end
    end
    describe 'add wrong script path' do
      it 'raises Errno::ENOENT' do
        expect { manager.run_script('robot_scripts/wrong_file') }.to raise_error(Errno::ENOENT)
      end
    end
  end

end
