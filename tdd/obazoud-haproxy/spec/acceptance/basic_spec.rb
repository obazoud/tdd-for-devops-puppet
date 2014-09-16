require 'spec_helper_acceptance'

describe 'configuring haproxy' do
  describe 'listen ports' do

    describe port('9090') do
      it { should_not be_listening }
    end

    describe port('9091') do
      it { should_not be_listening }
    end
  end

end