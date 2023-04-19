class AddRemoteColumnToRepositoryTable < ActiveRecord::Migration[7.0]
  def change
    add_column :repositories, :remote, :string
  end
end
