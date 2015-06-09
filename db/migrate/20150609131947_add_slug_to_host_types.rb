class AddSlugToHostTypes < ActiveRecord::Migration
  def change
    add_column :host_types, :slug, :string
    add_index :host_types, :slug
  end
end
