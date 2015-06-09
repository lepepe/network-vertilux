class AddSlugToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :slug, :string
    add_index :hosts, :slug
  end
end
