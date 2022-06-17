class Api::V1::SuggestionAdminSerializer < ActiveModel::Serializer
  attributes :id, :title_en, :title_de, :negative_impact, :question_id, :title

end
