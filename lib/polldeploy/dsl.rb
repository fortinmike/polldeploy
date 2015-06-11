require "polldeploy/logic/deployments"

def source(id, &build)
  
end

def deploy_from(source, options, &operation)
  deployment = PollDeploy::Deployment.new(source, options, operation)
  PollDeploy::Deployments::DEPLOYMENTS.push(deployment)
end