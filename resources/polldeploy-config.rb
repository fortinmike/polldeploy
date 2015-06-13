source :teamcity, TeamCitySource do |s|
  s.endpoint = "http://teamcity.mydomain.com"
  s.username = "username"
  s.password = "password"
end

deploy "MyProject", :teamcity, { :project => "MyProject", :branch => "master" } do |d|
  File.open(File.expand_path("~/deployments.txt", 'a')) do |file|
    file.puts("Deploying artifact #{d.artifact.path}")
  end
end
