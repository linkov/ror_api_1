pack = Package.where(:id =>4).first

Work.all.each do |work|

  random_score = rand(10..100)
  random_q = Question.where.not(:slider_type_id => [1,2]).where(:package => pack).order("RAND()").first
  random_user = User.where.not(:email =>work.user.email).order("RAND()").first
  Rating.create(:work => work, :question => random_q, :score =>random_score, :author => random_user)
end
