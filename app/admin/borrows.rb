ActiveAdmin.register Borrow do
  includes(book: :translations)
  includes :user

  controller do
    def scoped_collection
      super.includes(book: :translations)
    end
  end

  filter :book, collection: -> { Book.includes(:translations).all.map { |b| [b.name, b.id] } }



  action_item :approve, only: :show do
    link_to "Apprrove", approve_admin_borrow_path(borrow), method: :put if borrow.pending?
  end

  member_action :approve, method: :put do
    borrow = Borrow.find(params[:id])
    borrow.approved!
    redirect_to admin_borrow_path(borrow)
  end

  action_item :reject, only: :show do
    link_to "Reject", reject_admin_borrow_path(borrow), method: :put if borrow.pending?
  end

  member_action :reject, method: :put do
    borrow = Borrow.find(params[:id])
    borrow.rejected!
    redirect_to admin_borrow_path(borrow)
  end

  index do
    selectable_column
    id_column
    column :user
    column :book
    column('status') do |b|
      case b.status
      when 'pending'
        status_tag b.status, class: 'status-pending'
      when 'approved'
        status_tag b.status, class: 'status-approved'
      when 'rejected'
        status_tag b.status, class: 'status-rejected'
      else
        status_tag b.status, class: 'status-rejected'
      end
    end
    column('Returned') { |b| status_tag b.returned_at? }
    column('Returned At') { |b|  b.returned_at_formated }
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :book_id, :borrowed_at, :return_time, :returned_at, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :book_id, :borrowed_at, :return_time, :returned_at, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
