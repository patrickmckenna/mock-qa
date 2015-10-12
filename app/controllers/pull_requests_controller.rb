class PullRequestsController < ApplicationController

  def show
    @pull_request = PullRequest.new owner: "patrickmckenna", repo: "scratch",
                                    sha: "993e3925117198c374182df6aea707e97e9692ab",
                                    status: "pending"
  end

end
