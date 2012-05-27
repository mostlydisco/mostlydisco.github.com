#\ -p 4000

gem 'activesupport', '>= 2.3.5' # version required by Serve
gem 'serve', '>= 0.11.6'

require 'serve'
require 'serve/rack'

require 'sass/plugin/rack'
require 'compass'

# The project root directory
root = ::File.dirname(__FILE__)

# Compass
Compass.add_project_configuration(root + '/compass.config')
Compass.configure_sass_plugin!

use Rack::Static, :urls => ['/stylesheets'], :root => 'tmp'

# Middleware
use Rack::ShowStatus      # Nice looking 404s and other messages
use Rack::ShowExceptions  # Nice looking errors
use Sass::Plugin::Rack    # Compile Sass on the fly

run Rack::Cascade.new([
  Serve::RackAdapter.new(root + '/views'),
  Rack::Directory.new(root + '/public')
])
