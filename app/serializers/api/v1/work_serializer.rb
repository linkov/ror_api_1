class Api::V1::WorkSerializer < ActiveModel::Serializer
  attributes :manualflowpics, :id, :title, :pic_url, :description,:pic_thumb_url, :audio_url,
             :pic_preview_url, :is_visible, :work_category, :rate_count,:average_score,
             :pic_temp_url, :packages, :pic_small_thumb_url, :reviewratebackscore, :reviewratebackcomment,
             :pic_small_thumb_aspect_fit_url, :pics, :pictures, :created_at, :art_categories, :active_package_name, :active_package_code,
             :cover_id, :user_uid, :active_package_id, :presentation, :presentation_code,
             :testing, :questions, :userpack, :public, :manualflow, :manualflowpic_original, :manualflowpic_thumb, :expertrated, :expert, :presenterquestion, :presenterquestionanswer, :expertcomment

  def expert

    if object.expertrated
      expert = User.where(:id => object.ratings.collect(&:author_id)).first
    end

  end

  def manualflowpics
    object.manualflowpics.collect(&:id)
  end

  def manualflowpic_original
    if object.manualflowpic
      object.manualflowpic
    else
      if object.manualflowpics.first
        object.manualflowpics.first.url
      end

    end
  end

  def manualflowpic_thumb
    if object.manualflowpic
      object.manualflowpic + "-/preview/225x225/"
    else
      if object.manualflowpics.first
        object.manualflowpics.first.url + "-/preview/225x225/"
      end

    end
  end

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
