require 'cucumber'
require 'excon'
require 'faker'
require 'mime/types'
require 'pry'
require 'rspec'
require 'net/ssh'
require 'os'
require 'json-schema'
require 'jsonpath'

ENVIRONMENT = ENV["ENVIRONMENT"]
CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENVIRONMENT}.yaml"))

$base_uri = CONFIG["uri"]
