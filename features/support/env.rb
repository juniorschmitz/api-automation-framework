require 'cucumber'
require 'excon'
require 'faker'
require 'mime/types'
require 'pry'
require 'rspec'
require 'net/ssh'
require 'os'

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENVIRONMENT"]}.yaml"))
$base_uri = CONFIG["uri"]
