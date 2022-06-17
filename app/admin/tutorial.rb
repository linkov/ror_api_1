# ActiveAdmin.register Tutorial do
#
#   menu parent: 'Queminar'
#   before_filter :skip_sidebar!, :only => :index
#
#   permit_params :rating_type_id,tutorial_steps_attributes: [:id,:order, :text,:image,:tutorial_id,:tutorial_step_translations_attributes => [:text, :locale, :id]]
#
#   index  do
#     column :rating_type_id
#     actions
#   end
#
#   form(:html => { :multipart => true })  do |f|
#     f.inputs "Details" do
#       f.input :rating_type
#     end
#
#     f.has_many :tutorial_steps do |step|
#         step.input :image, :image_preview => true
#         step.input :order
#         step.has_many :tutorial_step_translations do |k|
#           k.input :locale, :as => :select, :collection => I18n.available_locales
#           k.input :text
#         end
#         #repeat as necessary for all fields
#     end
#     f.actions
#   end
#
#   show do
#     attributes_table do
#       row :rating_type
#     end
#
#     panel "Steps" do
#       table_for tutorial.tutorial_steps do
#         column 'Text' do |step|
#           step.text
#         end
#         column 'Order' do |step|
#           step.order
#         end
#         column "Image" do |step|
#           image_tag step.image.url(:thumb)
#         end
#       end
#     end
#   end
#
#
# end
#
# ActiveAdmin.register TutorialStep do
#   belongs_to :tutorial
#
#   permit_params :text,:image,:tutorial_id
#   end
#
#
