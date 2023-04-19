class AddGitlabIdToUserTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :gitlab_id, :integer
  end
end
