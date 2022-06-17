class Api::V1::WorkIntrogridSerializer < ActiveModel::Serializer
  attributes :id, :audio_url, :pic_preview_url, :is_visible

  def audio_url
    object.audio.url();
  end

  def rate_count
    current_work_ratings = Rating.where(:work_id => object.id)
    current_work_ratings.length
  end

  def questions
     object.questions.collect(&:id)
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

  def packages
    object.packages.collect(&:id)
  end

  def average_score

    current_work_ratings = Rating.where(:work_id => object.id)
    average_score =  current_work_ratings.collect(&:score).sum.to_f/current_work_ratings.length if current_work_ratings.length > 0
    if average_score && average_score != 0
      average_score.ceil
    else
      50

    end

  end

  def pic_url
    if object.wavescreenshot.url()
      object.wavescreenshot.url()
    else
      if object.cover_id
        pic = Picture.where(:id => object.cover_id).first
        if pic
          pic.image_url()
        else
          if object.pictures.length > 0
            object.pictures.first.image_url()
          end
        end
      else
        if object.pictures.length > 0
          object.pictures.first.image_url()
        end
      end
    end


  end

  def pic_temp_url

    if object.picture_tmp
      "/uploads/tmp/" + object.picture_tmp.to_s
    else
      nil
    end

  end

  def pic_small_thumb_aspect_fit_url

    if object.wavescreenshot.url(:small_thumb)
      object.wavescreenshot.url(:small_thumb)
    else
      if object.cover_id
        pic = Picture.where(:id => object.cover_id).first
        if pic
          pic.image_url(:small_thumb_aspect_fit)
        else
          if object.pictures.length > 0
            object.pictures.first.image_url(:small_thumb_aspect_fit)
          end

        end
      else
        if object.pictures.length > 0
          object.pictures.first.image_url(:small_thumb_aspect_fit)
        end
      end
    end
    end

  def pic_small_thumb_url

    if object.wavescreenshot.url(:small_thumb)
      object.wavescreenshot.url(:small_thumb)
    else
      if object.cover_id
          pic = Picture.where(:id => object.cover_id).first
          if pic
            pic.image_url(:small_thumb)
          else
            if object.pictures.length > 0
              object.pictures.first.image_url(:small_thumb)
            end
          end
        else
          if object.pictures.length > 0
            object.pictures.first.image_url(:small_thumb)
          end
      end
    end

  end

  def pic_preview_url
    if object.wavescreenshot.url(:preview)
      object.wavescreenshot.url(:preview)
    else
      if object.cover_id
        pic = Picture.where(:id => object.cover_id).first
        if pic
          pic.image_url(:preview)
        else
          if object.pictures.length > 0
            object.pictures.first.image_url(:preview)
          end
        end
      else
        if object.pictures.length > 0
          object.pictures.first.image_url(:preview)
        end
      end
    end

  end

  def pic_thumb_url
    if object.wavescreenshot.url(:thumb)
      object.wavescreenshot.url(:thumb)
    else
      if object.cover_id
        pic = Picture.where(:id => object.cover_id).first
        if pic
          pic.image_url(:thumb)
        else
          if object.pictures.length > 0
            object.pictures.first.image_url(:thumb)
          end
        end
      else
        if object.pictures.length > 0
          object.pictures.first.image_url(:thumb)
        end
      end
    end

  end


  def work_category
    object.work_category_id
  end




end
