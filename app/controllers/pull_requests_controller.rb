class PullRequestsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create]

  def show
    @pull_requests = PullRequest.all
  end

  def create
    @pull_request = PullRequest.new statuses_url: params[:pull_request][:statuses_url]
    if @pull_request.save
    else
    end
  end

end
