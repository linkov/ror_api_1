class AddTranslationToQTutorialLink < ActiveRecord::Migration

  def change
    reversible do |dir|
      dir.up do
        QTutorial.add_translation_fields! link: :string
      end

      dir.down do
        remove_column :q_tutorial_translations, :link
      end
    end
  end

end
