namespace :efwdbseed do
  desc 'Seed user images'
  task :cleanup_works_without_picture => :environment do
    Work.where('picture' => nil).delete_all
  end

end

