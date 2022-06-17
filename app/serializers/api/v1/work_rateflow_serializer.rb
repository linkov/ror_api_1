class Api::V1::WorkRateflowSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :audio_url,
             :is_visible, :work_category,
             :pictures, :created_at, :art_categories, :active_package_name, :active_package_code,
             :user_uid, :active_package_id, :presentation, :presentation_code,
             :testing, :userpack
  has_one :current_question

  # def next_work
  #   work = serialization_options[:next_work]
  #   render json: work, serializer: Api::V1::WorkRateflowSerializer
  # end

  def current_question
    Rails.logger.info "current_question serialization_options"
    Rails.logger.info serialization_options
    question = NextQuestionService.new({user: context[:current_user], work: object}).next()

    if question
       Api::V1::QuestionSerializer.new(question)
    end
  end

  def audio_url
    object.audio.url();
  end



  def art_categories
    object.art_categories.collect(&:id)
  end

  def pictures
    object.pictures.order(:order)
  end

  def presentation_code
    if object.presentation
      object.presentation.code
    end
  end

  def presentation
    if object.presentation
      object.presentation.id
    end
  end

  def user_uid
    User.find(object.user_id).uid
  end

  def active_package_name
    if object.userpack
      if object.title
        object.title+' package'
      else
        'Custom question selection'
      end
    else
      if object.packages.first
        object.packages.first.title
      end
  end


  end

  def active_package_code
    if object.packages.first
      object.packages.first.code
    end
  end

  def active_package_id
    if object.packages.first
      object.packages.first.id
    end
  end


  def work_category
    object.work_category_id
  end




end
