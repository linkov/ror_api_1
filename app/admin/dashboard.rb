ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do


  # columns do
  #   column do
  #     panel 'Amount of ratings' do
  #       ul do
  #         render 'scorechart_partial'
  #         # Rating.order(:updated_at).last(4) do |rate|
  #         #   li link_to(rate, admin_rating_path(rate))
  #         # end
  #       end
  #     end
  #
  #     # panel "Banned qustions (based on 2 people)" do
  #     #
  #     # # table_for Question.where(banned:true).each do |question|
  #     # #       column(:question)  { |question| link_to(question.title, admin_question_path(question)) }
  #     # #       column(:first_ban_work)   { |question| link_to(Ban.where(:question_id => question.id).first.work.id, admin_work_path(Ban.where(:question_id => question.id).first.work)) }
  #     # #       column(:second_ban_work)   { |question| link_to(Ban.where(:question_id => question.id).second.work.id, admin_work_path(Ban.where(:question_id => question.id).second.work)) }
  #     # # end
  #     #
  #     #
  #     # end
  #
  #     panel "Works waiting to be rated" do
  #
  #         User.all.each do |usr|
  #
  #           if usr.ratecount > 0 && usr.works.count > 0
  #
  #             table_for usr.works.each do |work|
  #
  #               column(:user)  { |work| link_to(work.user.uid, admin_user_path(work.user)) }
  #               column(:backend_link)  { |work| link_to(work.title, admin_work_path(work)) }
  #               column(:frontend_link)  { |work| link_to(work.title, ENV['EFW_BASE_APP_URL']+"/presentation?project_id="+work.id.to_s,:target => "_blank") }
  #             end
  #
  #           end
  #
  #         end
  #
  #
  #
  #     end
  #
  #     panel "Best performers (90-100 average)" do
  #
  #
  #       table_for Work.where(average_rating: 90..100).each do |work|
  #         column(:user)  { |work| link_to(work.user.email, admin_user_path(work.user)) }
  #         column(:work)   { |work| link_to(work.id, admin_work_path(work)) }
  #         column(:uploaded)      { |work| local_time(work.created_at) }
  #       end
  #     end
  #
  #
  #     panel "Worst performers (0-30 average)" do
  #
  #
  #       table_for Work.where(average_rating: 0..30).each do |work|
  #         column(:user)  { |work| link_to(work.user.email, admin_user_path(work.user)) }
  #         column(:work)   { |work| link_to(work.id, admin_work_path(work)) }
  #         column(:uploaded)      { |work| local_time(work.created_at) }
  #       end
  #     end
  #
  #     panel "Last 50 rates" do
  #       table_for Rating.order(created_at: :desc).limit(50).each do |rate|
  #         column(:author)  { |rate| link_to(rate.author.email, admin_user_path(rate.author)) }
  #         column(:question)   { |rate| rate.question.title }
  #         column(:work)      { |rate| link_to(rate.work.id, admin_work_path(rate.work.id)) }
  #       end
  #     end
  #
  #
  #   end
  #
  #   end
  #
  #



  end

end
