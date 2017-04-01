class AddFieldsToStatics < ActiveRecord::Migration
  def change
    add_column :static_contents, :body, :text
    add_column :static_contents, :content_type, :string
  end
end
