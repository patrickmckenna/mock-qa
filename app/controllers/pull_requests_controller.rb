require 'octokit'

class PullRequestsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create_update]

  def show
    @pull_requests = PullRequest.all
  end

  def create_update
    url = params[:pull_request][:url]
    statuses_url = params[:pull_request][:statuses_url]
    body = params[:pull_request][:repo][:full_name]
    sha = params[:pull_request][:head][:sha]
    @pull_request = PullRequest.find_by(url: url)
    if @pull_request
      @pull_request.statuses_url = statuses_url
    else
      @pull_request = PullRequest.new url: url, statuses_url: sha
    end
    @pull_request.save

    status = { target_url: 'https://whispering-retreat-8216.herokuapp.com/pull-requests',
               description: 'an example description',
               context: 'merge-manager' }
    client = Octokit::Client.new access_token: 'acf7cbfb357975289ca9212aab0a5caef1933604'
    client.create_status repo, sha, 'pending', status

    redirect_to root_url
  end

end
