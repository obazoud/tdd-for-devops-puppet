require 'beaker-rspec'

unless ENV['RS_PROVISION'] == 'no' or ENV['BEAKER_provision'] == 'no'
  # This will install the latest available package on el and deb based
  # systems fail on windows and osx, and install via gem on other *nixes
  foss_opts = { :default_action => 'gem_install' }

  if default.is_pe?; then install_pe; else install_puppet( foss_opts ); end

  hosts.each do |host|
    unless host.is_pe?
      on hosts, "mkdir -p #{hosts.first['distmoduledir']}"
    end

    # We ask the host to interpolate it's distmoduledir because we don't
    # actually know it on Windows until we've let it redirect us (depending
    # on whether we're running as a 32/64 bit process on 32/64 bit Windows
    moduledir = on(host, "echo #{host['distmoduledir']}").stdout.chomp
    on host, "mkdir -p #{moduledir}"
  end
end

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module
    puppet_module_install(:source => proj_root, :module_name => 'haproxy')
    hosts.each do |host|
      on host, puppet('module','install','puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
    end
  end
end
