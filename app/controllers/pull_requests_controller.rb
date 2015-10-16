require 'octokit'

class PullRequestsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create_update]

  def show
    @pull_requests = PullRequest.all
  end

  def create_update
    url = params[:pull_request][:url]
    # repo = params[:pull_request][:repo][:full_name]
    repo = 'patrickmckenna/scratch'
    sha = params[:pull_request][:head][:sha]

  @pull_request = PullRequest.find_by(url: url)
    if @pull_request
      @pull_request.sha = sha
    else
      @pull_request = PullRequest.new url: url, repo: repo, sha: sha
    end
    @pull_request.save

    sample_status = { target_url: 'https://merge-manager.herokuapp.com/pull-requests',
                      description: 'an example description',
                      context: 'merge-manager' }
    client = Octokit::Client.new access_token: ENV['GITHUB_ACCESS_TOKEN']
    client.create_status repo, sha, 'pending', sample_status

    redirect_to root_url
  end

end
