class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|

      t.string        :school_name,       null: false

      t.timestamps
    end
  end
end