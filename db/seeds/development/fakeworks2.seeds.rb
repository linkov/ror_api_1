pack = Package.find(3)
Illustration = WorkCategory.find(1)
photo = WorkCategory.find(2)
painting = WorkCategory.find(3)

seedUser12 = User.where(:name => "Jack12").first

Dir.foreach("_seed_image/seeduser14/photos") do |file|
  Work.create :user => seedUser12,:packages => [pack], :work_category =>photo,:is_visible => true, :picture => open( "_seed_image/seeduser14/photos/" + file)
end
