pack = Package.find(1)
Illustration = WorkCategory.find(1)
photo = WorkCategory.find(3)
painting = WorkCategory.find(5)

seedUser13 = User.create :uid =>"betatest13@betatestuser.com", :email => "betatest13@betatestuser.com", :password => "4004892700", :name => "Jack13"

Dir.foreach("_seed_image/seeduser13/illustration") do |file|
  Work.create :user => seedUser13,:packages => [pack], :work_category =>Illustration,:is_visible => true, :picture => open( "_seed_image/seeduser13/illustration/" + file)
end
