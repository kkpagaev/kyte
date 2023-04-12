class CreateBoilerplates < ActiveRecord::Migration[7.0]
  def change
    create_table :boilerplates do |t|
      t.string :name
      t.string :git_link

      t.timestamps
    end

    add_reference :repositories, :boilerplate, foreign_key: true
  end
end
