class SimplifyPullRequestModel < ActiveRecord::Migration
  change_table :pull_requests do |t|
    t.remove :owner, :repo, :sha
    # t.add :url
  end
end
