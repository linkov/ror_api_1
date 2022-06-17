# ActiveAdmin.register RateTypeDescription do
#
#   menu parent: 'System'
#   before_filter :skip_sidebar!, :only => :index
#   permit_params :focu_id,:rate_level_id,:description, :rate_type_description_translations_attributes => [:description, :locale, :id]
#
# end