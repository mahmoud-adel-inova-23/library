ActiveAdmin.register Notification do
  after_action :mark_notification_as_read, only: :show

  controller do
    def mark_notification_as_read
      current_admin_user.notifications.where(id: params[:id]).mark_as_read!
    end
  end

  index do
    selectable_column
    id_column
    column :read_at
    column('message') { |n| n.to_notification.message }
    column('sent at') { |n| n.created_at }
    column('seen') { |n| status_tag n.read? }
    column 'book url' do |notification|
      link_to notification.params[:book].name, admin_book_path(notification.params[:book])
    end
    actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :recipient_type, :recipient_id, :type, :params, :read_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:recipient_type, :recipient_id, :type, :params, :read_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
