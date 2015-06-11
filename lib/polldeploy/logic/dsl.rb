require "polldeploy/logic/deployments"

def source(id, &build)
  source = PollDeploy::Source.new(id)
  build.call(source)
end

def deploy_from(source, options, &deploy)
  deployment = PollDeploy::Deployment.new(source, options, deploy)
  PollDeploy::Deployments::DEPLOYMENTS.push(deployment)
end