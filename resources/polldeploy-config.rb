source :teamcity, TeamCitySource do |s|
  s.url = "http://teamcity.mydomain.com"
  s.username = "username"
  s.password = "password"
end

deploy "MyProject", :teamcity, { :project => "MyProject", :branch => "master" } do |d|
  d.artifacts.each do |artifact|
    log "Deploying artifact #{artifact}"
    file = download artifact
    log "Downloaded file is here: #{file}"
  end
end
