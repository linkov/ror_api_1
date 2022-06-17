class Api::V1::SuggestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :question_id

end
