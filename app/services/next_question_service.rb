class NextQuestionService < EFWService


  def initialize(params)
    @work = params[:work]
    @user = params[:user]
  end


  def next()
    next_question(@work,@user)
  end

  def next_question(work,user)
    Rails.logger.info "next_question"
    Rails.logger.info work
    Rails.logger.info user
    if work.testing
      testawork_choice = TestaworkChoice.where(:work_id => work.id,:user_id => user.id).first

      if testawork_choice
        return nil
      else
        testawork_package = Package.where(:code => 'testawork').first
        question = Question.where(:package => testawork_package).first
        return question
      end


    end

    unanswered_questions = unanswered_questions(work, user)

    if unanswered_questions.count == 0
      return nil
    end

    # single_phrasing = Phrasing.where(:code => 'single').first
    # uni_phrasing = Phrasing.where(:code => 'universal').first
    # multi_phrasing = Phrasing.where(:code => 'multiple').first
    #
    # if @current_work.pictures.length > 1
    #   questions_filtered_by_phrasing_type = unanswered_questions.where(:phrasing_id => [multi_phrasing,uni_phrasing])
    # else
    #   questions_filtered_by_phrasing_type = unanswered_questions.where(:phrasing_id => [single_phrasing,uni_phrasing])
    # end



    return unanswered_questions.sample()



  end


  private

  def unanswered_questions(work,user)

    user_rates = Rating.where(:author => user,:work_id => work.id)
    unanswered_questions = work.questions.where.not( :id => [user_rates.collect(&:question_id)] ).where(:active => true).where(:banned => false)
    return unanswered_questions
  end


end
