class AddIntroToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :short_intro, :text
  end
end
