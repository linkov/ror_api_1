ActiveAdmin.register SuggestionWordChoiceCount do
  menu parent: 'User generated'

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index  do
  selectable_column
  id_column
  column :count
  column "Word"  do |scount|
    scount.suggestion_word.word.to_s
  end
  column :question
  column :work
  actions
end


end
