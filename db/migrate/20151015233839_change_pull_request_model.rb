class ChangePullRequestModel < ActiveRecord::Migration
  change_table :pull_requests do |t|
    t.remove :statuses_url
    t.string :repo, :sha
  end
end
