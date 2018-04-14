ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :email, :password
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
    column :email
    column :email_provider do |user|
    user.email.split('@').last
    end
    column :member_since do |user|
      since = user.created_at
      "#{time_ago_in_words(since)} (#{since})"
    end
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs 'Datos de usuario' do
      f.input :email
      f.input :password
    end
    f.actions
  end

  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete('password')
        params[:user].delete('password confirmation')
      end
      super
    end
  end

  filter :email

end
