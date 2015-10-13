class PullRequestsController < ApplicationController

  def show
    @pull_request = PullRequest.new statuses_url: "https://api.github.com/repos/patrickmckenna/scratch/stauses/993e3925117198c374182df6aea707e97e9692ab"
  end

  def create
    @pull_request = PullRequest.new statuses_url: params[:pull_request][:statuses_url]
    if @pull_request.save
    else
    end
  end

end
