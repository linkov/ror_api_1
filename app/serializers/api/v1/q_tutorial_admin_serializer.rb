class Api::V1::QTutorialAdminSerializer < ActiveModel::Serializer
  attributes :id, :title_en, :title_de, :text_en, :text_de, :link_de, :link_en, :proficiency, :time, :tutorial_type, :placeholder, :price

  def proficiency
    object.proficiency_id
  end

  def tutorial_type
    object.tutorial_type_id
  end

end
