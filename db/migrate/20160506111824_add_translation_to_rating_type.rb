class AddTranslationToRatingType < ActiveRecord::Migration
  def self.up
    RatingType.create_translation_table!({
                                             :name => :string,
                                         }, {
                                             :migrate_data => true
                                         })
  end

  def self.down
    RatingType.drop_translation_table! :migrate_data => true
  end
end
