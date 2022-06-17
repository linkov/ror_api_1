classic_rate_types = RatingType.where(:package_id =>1)

Work.all.each do |work|

  random_score = rand(10..100)
  random_q = Question.where(:rating_type => classic_rate_types).order("RAND()").first
  random_user = User.where.not(:email =>work.user.email).order("RAND()").first
  Rating.create(:work => work, :question => random_q, :score =>random_score, :author => random_user)
end