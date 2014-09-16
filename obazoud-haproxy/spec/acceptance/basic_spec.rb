require 'spec_helper_acceptance'

describe 'configuring haproxy' do
  describe 'listen ports' do

    it 'should be able to listen ports' do
      pp = <<-EOS
      class { 'haproxy':
      }
      EOS
      apply_manifest(pp, :catch_failures => true)
    end

    describe service('haproxy') do
      it { should be_running }
    end

    describe port('80') do
      it { should be_listening }
    end

    describe port('22002') do
      it { should be_listening }
    end

    describe command('/usr/bin/curl -s -i http://localhost:22002/') do
      it { should return_exit_status 0 }
      its(:stdout) { 
        should match /HTTP\/1\.0 200/
        should match /Statistics Report for HAProxy/
      }
    end

  end
end
