class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name
      t.integer :host_type_id
      t.text :properties

      t.timestamps null: false
    end
  end
end
