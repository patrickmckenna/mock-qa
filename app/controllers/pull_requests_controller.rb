class PullRequestsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create_update]

  def show
    @pull_requests = PullRequest.all
  end

  def create_update
    url = params[:pull_request][:url]
    statuses_url = params[:pull_request][:statuses_url]
    @pull_request = PullRequest.find_by(url: url)
    if @pull_request
      @pull_request.statuses_url = statuses_url
    else
      @pull_request = PullRequest.new url: url, statuses_url: statuses_url
    end
    @pull_request.save
  end

end
