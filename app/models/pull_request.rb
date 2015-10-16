class PullRequest < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true
  validates :repo, presence: true
  validates :sha, presence: true, length: { is: 40 }
end
