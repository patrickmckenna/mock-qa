class AddStatusesUrlToPullRequests < ActiveRecord::Migration
  def change
    add_column :pull_requests, :statuses_url, :string
  end
end
