ActiveAdmin.register StaticContent do
  permit_params :body, :content_type

  index do
    selectable_column
    column :body
    column :content_type
    column :created_at
    actions
  end
end
