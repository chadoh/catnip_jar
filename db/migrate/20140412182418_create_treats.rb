class CreateTreats < ActiveRecord::Migration
  def change
    create_table :treats do |t|
      t.string :site
      t.string :username
      t.string :cookies

      t.timestamps
    end
  end
end
