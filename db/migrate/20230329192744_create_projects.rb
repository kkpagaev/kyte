class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title

      t.timestamps
    end

    create_join_table :projects, :users
  end
end
