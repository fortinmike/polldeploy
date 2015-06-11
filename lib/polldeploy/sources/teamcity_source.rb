require "teamcity"

module PollDeploy
  class TeamCitySource
    attr_accessor :endpoint
    attr_accessor :username
    attr_accessor :password

    def to_s
      "TeamCity ('#{@endpoint}' : '#{@username}' / '#{@password}')"
    end
  end
end