class AddTranslationToArtCategory < ActiveRecord::Migration
  def self.up
  ArtCategory.create_translation_table!({
                                           :title => :string,
                                       }, {
                                           :migrate_data => true,
                                           :remove_source_columns => true
                                       })
end

def self.down
  ArtCategory.drop_translation_table! :migrate_data => true
end

end
