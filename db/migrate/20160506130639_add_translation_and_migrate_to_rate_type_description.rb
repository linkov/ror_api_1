class AddTranslationAndMigrateToRateTypeDescription < ActiveRecord::Migration
  def self.up
    RateTypeDescription.create_translation_table!({
                                             :description => :text,
                                         }, {
                                             :migrate_data => true
                                         })
  end

  def self.down
    RateTypeDescription.drop_translation_table! :migrate_data => true
  end
end
