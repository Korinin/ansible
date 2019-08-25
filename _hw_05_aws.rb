require_relative '_hw_05_server.rb'

module AwsPlugin
  def aws_spawn_server!(s)
    s.spawned_by = s.type
  end
end

class Aws < Server
  include AwsPlugin

  TYPE = 'aws'.freeze
  attr_reader :type
  attr_accessor :spawned_by, :deployed_by

  def initialize
    @type = TYPE
  end

  def get_aws_ip!
    @ip = "aws-2.2.2.2"
  end

  def deploy!
    super
    @deployed_by = type
  end

  def self.new_server
    new
  end

end
