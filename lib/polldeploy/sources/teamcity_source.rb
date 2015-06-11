require "teamcity"

module PollDeploy
  class TeamCitySource
    def initialize(endpoint, username, password)
      @endpoint = endpoint
      @username = username
      @password = password
    end

    def to_s
      "TeamCity ('#{@endpoint}' : '#{@username}' / '#{@password}')"
    end
  end
end