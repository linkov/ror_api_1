# ActiveAdmin.register Introtext do
#
#   menu parent: 'Promo tools'
#   before_filter :skip_sidebar!, :only => :index
#
#   permit_params :text, :introtext_translations_attributes => [:text, :locale, :id]
#
#
#   index  do
#     column :text
#     actions
#   end
#
#
#   form do |f|
#       f.has_many :introtext_translations do |g|
#         g.input :locale, :as => :select, :collection => I18n.available_locales
#         g.input :text
#       end
#
#     f.actions
#   end
#
# end
