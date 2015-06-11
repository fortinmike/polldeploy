teamcity = PollDeploy::TeamCitySource.new("http://teamcity.mydomain.com", "username", "password")

deploy_from teamcity, { :project => "MyProject", :branch => "master" } do |artifact|
  File.open(File.expand_path("~/deployments.txt", 'a')) do |file|
    file.puts("Deploying artifact #{artifact.path}")
  end
end