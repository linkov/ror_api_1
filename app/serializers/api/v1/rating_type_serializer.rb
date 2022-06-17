class Api::V1::RatingTypeSerializer < ActiveModel::Serializer


  attributes :id,
             :name,
             :children,
             :parents,
             :typedescription,
             :overall,
             :ratingcount,
             :tutorial,
             :package,
             :is_emo,
             :is_word,
             :is_variants,
             :question,
             :positivecount,
             :question_name,
             :emo_10_ratings_count,
             :emo_20_ratings_count,
             :emo_30_ratings_count,
             :emo_40_ratings_count,
             :emo_50_ratings_count,
             :emo_60_ratings_count,
             :emo_70_ratings_count,
             :emo_80_ratings_count,
             :emo_90_ratings_count,
             :emo_100_ratings_count

   # has_one :question,



  @all_emo_ratings_for_rate_type_var = nil
  @overall_rating_for_all_types = nil
  @overall_rating_for_all_types_work_filter = nil



  def all_emo_ratings_for_rate_type





    if serialization_options[:filter]


      if @all_emo_ratings_for_rate_type_var == nil
        @all_emo_ratings_for_rate_type_var = Rating.where(:work_id => serialization_options[:filter],:question_id =>[Question.where(:rating_type_id => object.id,:slider_type =>SliderType.where(:code => 'emo')).collect(&:id)])

      else
        @all_emo_ratings_for_rate_type_var
      end


    else



      if @all_emo_ratings_for_rate_type_var == nil
        @all_emo_ratings_for_rate_type_var = Rating.where(:work_id => [Work.where(:user => scope.current_user).collect(&:id)],:question_id =>[Question.where(:rating_type_id => object.id,:slider_type =>SliderType.where(:code => 'emo')).collect(&:id)])

      else
        @all_emo_ratings_for_rate_type_var
      end



    end








  end


  def package
    object.package.id
  end

  def is_word

    any_question = Question.where(:rating_type_id => object.id).first

    if any_question == nil
      return false
    end

    any_question_slider = SliderType.where(:id =>any_question.slider_type_id).first

    if any_question_slider && any_question_slider.code == 'word'
      true
    else
      false
    end

  end


  def is_emo

    any_question = Question.where(:rating_type_id => object.id).first

    if any_question == nil
      return false
    end

    any_question_slider = SliderType.where(:id =>any_question.slider_type_id).first

    if any_question_slider && any_question_slider.code == "emo"
      true
    else
      false
    end

  end

  def is_variants

    any_question = Question.where(:rating_type_id => object.id).first

    if any_question == nil
      return false
    end

    any_question_slider = SliderType.where(:id =>any_question.slider_type_id).first

    if any_question_slider && any_question_slider.code == "variants"
      true
    else
      false
    end

  end


  def question
    question = Question.where(:rating_type_id => object.id).first
    if question
      question.id
    end
  end

  def question_name
    question = Question.where(:rating_type_id => object.id).first
    if question
      question.title
    else
      ""
    end
  end

  def emo_10_ratings_count
    out = all_emo_ratings_for_rate_type
    out.where("score >= :start AND score < :end",{start: 0, end: 10}).count
  end

  def emo_20_ratings_count
    out = all_emo_ratings_for_rate_type
    out.where("score >= :start AND score < :end",{start: 10, end: 20}).count
  end

  def emo_30_ratings_count

    out = all_emo_ratings_for_rate_type
    out.where("score >= :start AND score < :end",{start: 20, end: 30}).count

  end

  def emo_40_ratings_count
    out = all_emo_ratings_for_rate_type
    out.where("score >= :start AND score < :end",{start: 30, end: 40}).count
  end

  def emo_50_ratings_count
    out = all_emo_ratings_for_rate_type
    out.where("score >= :start AND score < :end",{start: 40, end: 50}).count
  end

  def emo_60_ratings_count
    out = all_emo_ratings_for_rate_type
    out.where("score >= :start AND score < :end",{start: 50, end: 60}).count

  end

  def emo_70_ratings_count

    out = all_emo_ratings_for_rate_type
    out.where("score >= :start AND score < :end",{start: 60, end: 70}).count

  end

  def emo_80_ratings_count
    out = all_emo_ratings_for_rate_type
    out.where("score >= :start AND score < :end",{start: 70, end: 80}).count
  end

  def emo_90_ratings_count
    out = all_emo_ratings_for_rate_type
    out.where("score >= :start AND score < :end",{start: 80, end: 90}).count

  end

  def emo_100_ratings_count
    out = all_emo_ratings_for_rate_type
    out.where("score >= :start AND score < :end",{start: 90, end: 100}).count
  end


  def overall


    if serialization_options[:filter]


      if @overall_rating_for_all_types_work_filter == nil
        all_ratings = Rating.where(:work_id => serialization_options[:filter],:question_id =>[Question.where(:rating_type_id => object.id).pluck(:id)])
        average_score =  all_ratings.collect(&:score).sum.to_f/all_ratings.length if all_ratings.length > 0
        @overall_rating_for_all_types_work_filter = average_score
      else
        average_score =  @overall_rating_for_all_types_work_filter

      end


    else


      if @overall_rating_for_all_types == nil

        all_ratings = Rating.where(:work_id => [Work.where(:user => scope.current_user).pluck(:id)],:question_id =>[Question.where(:rating_type_id => object.id).pluck(:id)])
        average_score =  all_ratings.collect(&:score).sum.to_f/all_ratings.length if all_ratings.length > 0
        @overall_rating_for_all_types = average_score
      else

        average_score =  @overall_rating_for_all_types

      end




    end



    if average_score && average_score != 0
      average_score.ceil
    else
      50
    end
  end

  def tutorial
    if object.tutorials.first
      object.tutorials.first.id
    end

  end

  def positivecount


    positive_variants = Suggestion.where(:question_id =>[Question.where(:rating_type_id => object.id).pluck(:id)],:is_positive => true)

    if serialization_options[:filter]
      all_ratings = SuggestionChoice.where(:work_id => serialization_options[:filter],:question_id =>[Question.where(:rating_type_id => object.id).pluck(:id)], :suggestion_id => positive_variants.pluck(:id))

    else
      all_ratings = SuggestionChoice.where(:work_id => [Work.where(:user => scope.current_user).pluck(:id)],:question_id =>[Question.where(:rating_type_id => object.id).pluck(:id)], :suggestion_id => positive_variants.pluck(:id))

    end

    if all_ratings
      all_ratings.count
    else
      0
    end

  end

  def ratingcount

    if is_variants

      if serialization_options[:filter]
        all_ratings = SuggestionChoice.where(:work_id => serialization_options[:filter],:question_id =>[Question.where(:rating_type_id => object.id).pluck(:id)])

      else
        all_ratings = SuggestionChoice.where(:work_id => [Work.where(:user => scope.current_user).collect(&:id)],:question_id =>[Question.where(:rating_type_id => object.id).pluck(:id)])

      end


    else
      if serialization_options[:filter]

        all_ratings = Rating.where(:work_id => serialization_options[:filter],:question_id =>[Question.where(:rating_type_id => object.id).pluck(:id)])

      else

         all_ratings = Rating.where(:work_id => [Work.where(:user => scope.current_user).pluck(:id)],:question_id =>[Question.where(:rating_type_id => object.id).pluck(:id)])
        # all_ratings = Rating.all.select('rating.*,COUNT(id)')


      end

    end






    if all_ratings
      all_ratings.count
    else
      0
    end
  end

  def children
    object.descendant_ids if object.has_children?
  end

  def parents
    object.ancestor_ids unless object.is_root?
  end

  def typedescription

    "no description"

  end

end
