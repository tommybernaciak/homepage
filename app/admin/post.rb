ActiveAdmin.register Post do

  permit_params :title, :short_intro, :body, :published, :all_tags

  index do
    selectable_column
    column :title
    column :short_intro
    column :all_tags
    column :published
    column :published_at
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :short_intro
      row :body
      row :all_tags
      row :published
      row :published_at
      row :created_at
      row :updated_at
    end
  end


  form do |f|
    inputs :title, :short_intro, :body, :all_tags, :published
    actions
  end
end
