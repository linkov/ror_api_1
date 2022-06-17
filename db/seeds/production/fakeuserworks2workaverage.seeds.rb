def average_score_for_work_for_rate_type(ratetype,work)

  current_rate_type_questions = Question.where( :rating_type => ratetype )
  current_work_ratings_for_rate_type = Rating.where(:work_id => work.id, :question_id => [current_rate_type_questions.collect(&:id)])
  average_score =  current_work_ratings_for_rate_type.collect(&:score).sum.to_f/current_work_ratings_for_rate_type.length if current_work_ratings_for_rate_type.length > 0
  return average_score

end

Work.all.each do |work|

  root_types = []
  root_types_average_scores = []

  classic_pack = Package.find(1)
  relevant_rating_types = RatingType.where(:package => classic_pack)
  relevant_rating_types.each do |rtype|
    if rtype.is_root?
      root_types.push(rtype)

      average = average_score_for_work_for_rate_type(rtype,work)
      if average
        root_types_average_scores.push(average)
      end


    end

  end

  if root_types_average_scores.count
    work.update_attribute(:l1_average,root_types_average_scores.reduce(:+).to_f / root_types_average_scores.size)
  end

end