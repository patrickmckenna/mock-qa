class PullRequest < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  # statuses url could be shared by different pull requests included same ref
  # hence no uniqueness requirement
  validates :statuses_url, presence: true
end
