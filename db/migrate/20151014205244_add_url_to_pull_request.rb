class AddUrlToPullRequest < ActiveRecord::Migration
  def change
    add_column :pull_requests, :url, :string
  end
end
