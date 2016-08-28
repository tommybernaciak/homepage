class AddSectionIdToSections < ActiveRecord::Migration
  def change
    add_column :sections, :section_id, :string
  end
end
