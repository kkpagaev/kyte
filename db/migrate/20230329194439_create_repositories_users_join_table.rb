class CreateRepositoriesUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :repositories, :users
  end
end
