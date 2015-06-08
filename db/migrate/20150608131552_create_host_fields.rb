class CreateHostFields < ActiveRecord::Migration
  def change
    create_table :host_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :host_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
