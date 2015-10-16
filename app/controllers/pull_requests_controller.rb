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

    pull_request_action = request.request_parameters[:action]
    case pull_request_action
    when 'opened', 'reopened'
      PullRequest.create url: url, repo: repo, sha: sha
    when 'synchronize'
      PullRequest.find_by(url: url).update(sha: sha)
    when 'closed'
      PullRequest.find_by(url: url).destroy
    end

    set_pending_state repo, sha #unless pull_request_action == 'closed'?
    redirect_to root_url
  end

  private

  def set_pending_state repo, sha
    sample_status = { target_url: 'https://merge-manager.herokuapp.com/pull-requests',
                      description: 'an example description',
                      context: 'merge-manager' }
    client = Octokit::Client.new access_token: ENV['GITHUB_ACCESS_TOKEN']
    client.create_status repo, sha, 'pending', sample_status
  end

end
