class AddRemoteUrlColumnToRepositoryTable < ActiveRecord::Migration[7.0]
  def change
    add_column :repositories, :remote_url, :string
  end
end
