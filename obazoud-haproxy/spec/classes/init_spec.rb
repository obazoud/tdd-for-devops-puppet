require 'spec_helper'

describe 'haproxy' do

  describe 'standard installation' do
    it { should contain_class('haproxy::install') }
    it { should contain_class('haproxy::config') }
    it { should contain_class('haproxy::service') }
  end

  describe 'package installation' do
    it { should contain_package('haproxy').with_ensure('present') }
  end

  describe 'service up and running' do
    it { should contain_service('haproxy').with(
      'ensure'     => 'running',
      'enable'     => true,
      'hasstatus'  => true,
      'hasrestart' => true
      )
    }
  end

  context 'configure HAProxy with admin => true' do
    let(:params) { {:admin => true} }

    it do
      should contain_file('/etc/haproxy/haproxy.cfg') \
        .with_content(/listen admin/) \
        .with_content(/bind 127.0.0.1:22002/)
    end

  end

  context 'configure HAProxy with admin => false' do
    let(:params) { {:admin => false} }

    it do
      should_not contain_file('/etc/haproxy/haproxy.cfg') \
        .with_content(/listen admin/) \
        .with_content(/bind 127.0.0.1:22002/)
    end

  end

end
