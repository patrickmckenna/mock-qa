class PullRequest < ActiveRecord::Base
  validates :statuses_url, presence: true
end
