class PullRequest < ActiveRecord::Base
  validates :statuses_url, presence: true, uniqueness: true
end
