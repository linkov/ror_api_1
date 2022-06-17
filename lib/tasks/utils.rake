namespace :utils do

  desc "seed_default_questions_slider_translations"
  task seed_default_questions_slider_translations: :environment do

    Question.all.each do |question|
      if question.slider_type.code == "emo"
        question.attributes = { slider_wording_10:"Ohneeein!",locale: :de }
        question.attributes = { slider_wording_20:"Igitt!",locale: :de }
        question.attributes = { slider_wording_30:"GRRRR!",locale: :de }
        question.attributes = { slider_wording_40:"F**YOU!",locale: :de }
        question.attributes = { slider_wording_50:"Och nö, echt jetzt?!",locale: :de }
        question.attributes = { slider_wording_60:"Ok?!",locale: :de }
        question.attributes = { slider_wording_70:"mmmmmmm",locale: :de }
        question.attributes = { slider_wording_80:"YEAH!",locale: :de }
        question.attributes = { slider_wording_90:"HAHA!",locale: :de }
        question.attributes = { slider_wording_100:"waaaaahh",locale: :de }

        question.attributes = { slider_wording_10:"sad",locale: :en }
        question.attributes = { slider_wording_20:"disgusting",locale: :en }
        question.attributes = { slider_wording_30:"angry",locale: :en }
        question.attributes = { slider_wording_40:"upset",locale: :en }
        question.attributes = { slider_wording_50:"disappointed",locale: :en }
        question.attributes = { slider_wording_60:"amazed",locale: :en }
        question.attributes = { slider_wording_70:"happy",locale: :en }
        question.attributes = { slider_wording_80:"excited",locale: :en }
        question.attributes = { slider_wording_90:"funny",locale: :en }
        question.attributes = { slider_wording_100:"love",locale: :en }


      else

        question.attributes = { slider_wording_10:"Weitaaaaa!",locale: :de }
        question.attributes = { slider_wording_20:"och nö",locale: :de }
        question.attributes = { slider_wording_30:"gabs schon.",locale: :de }
        question.attributes = { slider_wording_40:"bemüht.",locale: :de }
        question.attributes = { slider_wording_50:"jein.",locale: :de }
        question.attributes = { slider_wording_60:"ok, es wird...",locale: :de }
        question.attributes = { slider_wording_70:"weitermachen!",locale: :de }
        question.attributes = { slider_wording_80:"...95%",locale: :de }
        question.attributes = { slider_wording_90:"Kopfkino",locale: :de }
        question.attributes = { slider_wording_100:"MINDFUCK",locale: :de }

        question.attributes = { slider_wording_10:"only with prozac",locale: :en }
        question.attributes = { slider_wording_20:"copykill",locale: :en }
        question.attributes = { slider_wording_30:"nice try, bro",locale: :en }
        question.attributes = { slider_wording_40:"...",locale: :en }
        question.attributes = { slider_wording_50:"hm...",locale: :en }
        question.attributes = { slider_wording_60:"Im pleased",locale: :en }
        question.attributes = { slider_wording_70:"keep working",locale: :en }
        question.attributes = { slider_wording_80:"almost",locale: :en }
        question.attributes = { slider_wording_90:"boohya",locale: :en }
        question.attributes = { slider_wording_100:"MINDFUCK",locale: :en }

      end

      question.save!

    end

  end


  desc "insert_same_options_for_similar_choosomatic_questions_production"
  task insert_same_options_for_similar_choosomatic_questions_production: :environment do

  q1 = Question.where(:title => "Do you like this work?", :package_id => 4).first
  q2 = Question.where(:title => "Do you like the colours?", :package_id => 4).first
  q3 = Question.where(:title => "Is the medium chosen well?", :package_id => 4).first
  q4 = Question.where(:title => "Do you like the selection of the pictures?", :package_id => 4).first
  q5 = Question.where(:title => "Is the work perfect? If no, in which style could the work looks more interesting?", :package_id => 4).first
  q6 = Question.where(:title => "Does the foreground of the image matches the background?", :package_id => 4).first
  q7 = Question.where(:title => "How well do you like the use of writing, the typography?", :package_id => 4).first

  Question.where(:title => "Do you like this work?").where.not(:package_id => 4).each do |q1_item|
    q1_item.suggestions = q1.suggestions
    q1_item.save!
  end

  Question.where(:title => "Do you like the colours?").where.not(:package_id => 4).each do |q2_item|
    q2_item.suggestions = q2.suggestions
    q2_item.save!
  end

  Question.where(:title => "Is the medium chosen well?").where.not(:package_id => 4).each do |q3_item|
    q3_item.suggestions = q3.suggestions
    q3_item.save!
  end

  Question.where(:title => "Do you like the selection of the pictures?").where.not(:package_id => 4).each do |q4_item|
    q4_item.suggestions = q4.suggestions
    q4_item.save!
  end

  Question.where(:title => "Is the work perfect? If no, in which style could the work looks more interesting?").where.not(:package_id => 4).each do |q5_item|
    q5_item.suggestions = q5.suggestions
    q5_item.save!
  end

  Question.where(:title => "Does the foreground of the image matches the background?").where.not(:package_id => 4).each do |q6_item|
    q6_item.suggestions = q6.suggestions
    q6_item.save!
  end

  Question.where(:title => "Does the foreground of the image matches the background?").where.not(:package_id => 4).each do |q7_item|
    q7_item.suggestions = q7.suggestions
    q7_item.save!
  end

  Question.where(:title => "Do the sounds, music in the background matches with the foreground?").where.not(:package_id => 4).each do |q7_item|
    q7_item.suggestions = q7.suggestions
    q7_item.save!
  end


  end


  desc "remove_questions_not_fitting_all_works"
  task remove_questions_not_fitting_all_works: :environment do

  q1 = Question.where(:title => "How well do you like the use of writing, the typography?").first
  q2 = Question.where(:title => "How politically explosive does the work appear to you?").first
  q3 = Question.where(:title => "How socially relevant does the concept of the work appear to you?").first
  q4 = Question.where(:title => "How are optical illusions and three-dimensionality used?").first
  q5 = Question.where(:title => "How well were forms and silhouettes used?").first
  q6 = Question.where(:title => "How well does sharpness and blur crystallize the subject?").first
  questions = [q1,q2,q3,q4,q5,q6]

    Work.all.each do |work|

      questions.each do |q|

        if work.questions.include?(q)
            work.questions.delete(q)
            work.save
        end
      end


    end

  end

  desc "prepare_for_selectable_questions"
  task prepare_for_selectable_questions: :environment do


    Work.where(:work_category_id => nil).destroy_all
    Work.all.each do |work|

    if work.questions.count == 0
        pack = work.packages.first
        work.questions = pack.questions
        work.art_categories = work.work_category.art_categories

        work.save

    end

    end

  end

  desc "prepare_for_testawork_as_prestage"
  task prepare_for_testawork_as_prestage: :environment do

    Setting.all.destroy_all
    new_setting = Setting.new(:code => 'testawork_limit',:title => 'Number of unique choices required for Find The Best to finish',:value => 4)
    new_setting.save!

    beta_package = Package.where(:title => '').first
    test_a_work_package = Package.where(:code => 'testawork').first
    test_a_work_package.update_attribute(:active,false)

    Work.all.each do |work|

      if work.packages.first == test_a_work_package
        work.packages.delete(test_a_work_package)
        work.packages << beta_package
        work.update_attribute(:testing,true)

      end

    end

  end

  desc "set_work_average"
  task set_work_average: :environment do

    Work.all.each do |work|

      average_scores = Rating.where(:work_id => work.id).where(:emocode => 0).where(:suggestion_word_choice_id => nil).where(:suggestion_choice_id => nil).extend(DescriptiveStatistics)
      mean = average_scores.mean(&:score) || 50
      work.update_attribute(:average_rating,mean)

    end

  end


  desc "set_expertrated"
  task set_expertrated: :environment do

    Work.all.each do |work|

      if inreview(work)
        work.update_attribute(:expertrated,false)
      else
        work.update_attribute(:expertrated,true)
      end


    end

  end

  def inreview(object)
    work_questions = object.questions
    manualflow_questions_work_rates = Rating.where(:work_id => object.id,:question_id => work_questions.collect(&:id))
    choosomatic_rates = SuggestionChoice.where(:work_id => object.id,:question_id => work_questions.collect(&:id))
    taggitator_rates = SuggestionWordChoice.where(:work_id => object.id,:question_id => work_questions.collect(&:id))
    all_questions_answered = work_questions.count == manualflow_questions_work_rates.count+choosomatic_rates.count+taggitator_rates.count
    return !all_questions_answered

  end


  desc "set_norates_counts"
  task set_norates_counts: :environment do

    Work.all.each do |work|

      if work.ratings.count == 0
        work.update_attribute(:norates,true)
      else
        work.update_attribute(:norates,false)
      end


    end

  end

  desc "send_new_rates_email"
  task send_new_rates_email: :environment do

    works = Work.where(:manualflow => false)

    works.each do |work|
      # work.ratings between now and last 24 hours
      work_rates = Rating.where(:work_id => work.id)
      work_rates_today = work_rates.where(created_at: (Time.now - 24.hours)..Time.now)


      # if ratings.count and user.ratecount > 1 + testing condition- user = a.linkov@me.com
      if work_rates_today.count > 0 && work.user.manualflow == false
        # send email
        users =  User.where(:id => work_rates_today.collect(&:author_id)).uniq

        MandrillUserMailer.new_rates(work,users.count,work.user.locale).deliver_now
      end


    end

  end

  desc "send_recent_rates_email"
  task send_recent_rates_email: :environment do

    User.all.each do |user|

      work_rates = Rating.where(:work_id => user.works.collect(&:id))
      work_rates_recent = work_rates.where(created_at: (Time.now - 2.weeks)..Time.now)


      if work_rates_recent.count > 0
        MandrillUserMailer.recent_rates(user,user.locale).deliver_now
      end


    end

  end

end
