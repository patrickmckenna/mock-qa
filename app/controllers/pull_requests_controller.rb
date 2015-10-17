require 'octokit'

class PullRequestsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:process_hook]

  def index
    @pull_requests = PullRequest.all
  end

  def process_hook
    url = params[:pull_request][:html_url]
    repo = params[:pull_request][:head][:repo][:full_name]
    sha = params[:pull_request][:head][:sha]

    pull_request_action = request.request_parameters[:action]
    case pull_request_action
    when 'opened', 'reopened'
      PullRequest.create url: url, repo: repo, sha: sha
    when 'synchronize'
      PullRequest.find_by(url: url).update(sha: sha)
    when 'closed'
      PullRequest.find_by(url: url).destroy
    end

    set_state repo, sha, 'pending' #unless pull_request_action == 'closed'?
    head :ok
  end

  private

  def set_state repo, sha, state
    sample_status = { target_url: 'https://merge-manager.herokuapp.com/pull-requests',
                      description: 'an example description',
                      context: 'merge-manager' }
    client = Octokit::Client.new access_token: ENV['GITHUB_ACCESS_TOKEN']
    client.create_status repo, sha, state, sample_status
  end

end
