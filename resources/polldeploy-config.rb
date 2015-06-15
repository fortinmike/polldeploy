source :teamcity, TeamCitySource do |s|
  s.url = "http://teamcity.mydomain.com"
  s.username = "username"
  s.password = "password"
end

deploy "MyProject", :teamcity, { :project_id => "MyProject", :branch => "master" } do |d|
  d.artifacts.each { |a| log "Deploying artifact #{artifact.path}" }
end
