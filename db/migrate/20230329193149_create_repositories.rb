class CreateRepositories < ActiveRecord::Migration[7.0]
  def change
    create_table :repositories do |t|
      t.string :title
      t.string :name

      t.timestamps
    end

    add_reference :repositories, :project, foreign_key: true
  end
end
