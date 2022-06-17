pack = Package.find(3)
Illustration = WorkCategory.find(1)
photo = WorkCategory.find(2)
painting = WorkCategory.find(3)

seedUser13 = User.where(:name => "Jack13").first

Dir.foreach("_seed_image/seeduser13/illustration") do |file|
  Work.create :user => seedUser13,:packages => [pack], :work_category =>Illustration,:is_visible => true, :picture => open( "_seed_image/seeduser13/illustration/" + file)
end
