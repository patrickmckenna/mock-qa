class CreatePullRequests < ActiveRecord::Migration
  def change
    create_table :pull_requests do |t|
      t.string :owner
      t.string :repo
      t.string :sha
      t.string :status
      t.string :target_url
      t.string :description
      t.string :context

      t.timestamps null: false
    end
  end
end
