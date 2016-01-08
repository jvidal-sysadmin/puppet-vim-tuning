require 'spec_helper'
describe 'vim_tuning' do

  context 'with defaults for all parameters' do
    it { should contain_class('vim_tuning') }
  end
end
