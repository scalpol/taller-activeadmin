ActiveAdmin.register Post do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :title, :content, :user_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    column :id
    column :author do |post|
      post.user.email
    end
    column :title
    column :comments do |post|
      post.comments.count
    end
    actions
  end

  form do |f|
    f.inputs 'Agregar un nuevo post' do
      input :user_id,
        label: 'Author',
        as: :select,
        collection: User.pluck(:email, :id)
      input :title
      input :content
    end
    actions
  end

  filter :created_at

end
