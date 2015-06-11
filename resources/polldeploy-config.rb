source :teamcity do |s|
  s.type = TeamCitySource
  s.endpoint = "http://teamcity.mydomain.com"
  s.username = "username"
  s.password = "password"
end

deploy_from :teamcity, { :project => "MyProject", :branch => "master" } do |source, artifact|
  File.open(File.expand_path("~/deployments.txt", 'a')) do |file|
    file.puts("Deploying artifact #{artifact.path}")
  end
end