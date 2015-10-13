class PullRequest < ActiveRecord::Base
  validates :owner, presence: true
  validates :repo, presence: true
  validates :sha, presence: true, length: { is: 40 }
end
