

* Generate project

puppet module generate obazoud-haproxy

* View project structure

* Install application's dependencies manager

gem install bundler

* Install application's dependencies

bundle install

 bundle exec rake -T
rake beaker            # Run beaker acceptance tests
rake beaker_nodes      # List available beaker nodesets
rake build             # Build puppet module package
rake clean             # Clean a built module package
rake coverage          # Generate code coverage information
rake help              # Display the list of available rake tasks
rake lint              # Check puppet manifests with puppet-lint / Run puppet-lint
rake spec              # Run spec tests in a clean fixtures directory
rake spec_clean        # Clean up the fixtures directory
rake spec_prep         # Create the fixtures directory
rake spec_standalone   # Run spec tests on an existing fixtures directory
rake syntax            # Syntax check Puppet manifests and templates
rake syntax:hiera      # Syntax check Hiera config files
rake syntax:manifests  # Syntax check Puppet manifests
rake syntax:templates  # Syntax check Puppet templates
rake validate          # Check syntax of Ruby files and call :syntax / Validate manifests, templates, and ruby files

* Fix

sudo chmod go-w /usr/bin

* Add test task

synthax + lint + spec

* Puppet Lint

http://puppet-lint.com/


* Puppet Test

bundle exec rake test