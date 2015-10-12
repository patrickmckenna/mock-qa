class PullRequest < ActiveRecord::Base
  validates :owner, presence: true
  validates :repo, presence: true
  validates :sha, presence: true, length: { is: 40 }
  validates :status, presence: true
  # need to check that it's a valid status
end
