class Api::V1::BackrateSerializer < ActiveModel::Serializer
  attributes :id, :score, :user_id, :work_id, :question_id

end
