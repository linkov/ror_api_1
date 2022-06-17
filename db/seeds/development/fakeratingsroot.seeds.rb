classic_rate_types = RatingType.where(:package_id =>3)
root_types = []


classic_rate_types.each do |rr|
  if rr.is_root?
    root_types.push(rr)
  end

end



Work.all.each do |work|

  random_score = rand(10..100)
  random_q = Question.where(:rating_type => root_types).order("RAND()").first
  random_user = User.where.not(:email =>work.user.email).order("RAND()").first
  Rating.create(:work => work, :question => random_q, :score =>random_score, :author => random_user)
end