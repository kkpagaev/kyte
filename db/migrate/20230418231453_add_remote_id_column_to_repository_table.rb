class AddRemoteIdColumnToRepositoryTable < ActiveRecord::Migration[7.0]
  def change
    add_column :repositories, :remote_id, :string
  end
end
