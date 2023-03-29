class CreateRepositories < ActiveRecord::Migration[7.0]
  def change
    create_table :repositories do |t|
      t.string :title
      t.string :name

      t.timestamps
    end
  end
end
