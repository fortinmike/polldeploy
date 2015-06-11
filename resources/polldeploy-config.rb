teamcity = PollDeploy::TeamCitySource.new("http://teamcity.mydomain.com", "username", "password")

deploy :source => teamcity do |artifact|
  path = artifact.path
  File.open(File.expand_path("~/deployments.txt", 'a')) do |file|
    file.puts("Deploying artifact #{path}")
  end
end