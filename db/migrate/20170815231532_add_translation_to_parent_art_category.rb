class AddTranslationToParentArtCategory < ActiveRecord::Migration
  def change
    ParentArtCategory.create_translation_table!({
      :title => :string,
    }, {
      :migrate_data => true,
      :remove_source_columns => true
    })
  end
end
