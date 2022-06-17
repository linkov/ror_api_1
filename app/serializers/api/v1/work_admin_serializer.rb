class Api::V1::WorkAdminSerializer < ActiveModel::Serializer
  attributes :expertcomment, :reviewlang, :title, :description, :manualflowpix, :manualflowpics, :id, :payed, :questions, :manualflow, :manualflowpic_original, :manualflowpic_thumb_square, :created_at, :expertrated, :art_categories, :worklink, :presentationwidth, :presentationheight, :presenterquestion, :presenterquestionanswer

  def manualflowpix
    if object.manualflowpics.length > 0
      arr = object.manualflowpics.collect { |pic|
        {
            'id': pic.id,
            'src': pic.url,
            'thumb': pic.url+"-/preview/300x300/",
            'w': pic.width,
            'h': pic.height
         }
      }

    end
  end

  def art_categories
    object.art_categories.collect(&:id)
  end

  def manualflowpics
    object.manualflowpics.collect(&:id)
  end

  def payed
    in_payed = Reviewpayment.where(:work_id => object.id).count > 0
    in_payed
  end

  def manualflowpic_original
    if object.manualflowpic
      object.manualflowpic
    end
  end

  def manualflowpic_thumb_square
    if object.manualflowpic
      object.manualflowpic + "-/preview/50x50/"
    else
      if object.manualflowpics.first
        object.manualflowpics.first.url + "-/preview/50x50/"
      end

    end
  end

  def questions
     object.questions.collect(&:id)
  end





end
