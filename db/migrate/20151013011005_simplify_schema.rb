class SimplifySchema < ActiveRecord::Migration
  change_table :pull_requests do |t|
    t.remove :status, :target_url, :description, :context
  end
end
