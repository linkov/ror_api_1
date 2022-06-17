class Api::V1::QuestionsController < Api::ApiController
  # before_action :authenticate_user!

  def show
    render json: Question.find(params[:id])
  end

  def index

    if params[:package]

      render json:Question.all.where(:package_id => params[:package]), each_serializer: Api::V1::QuestionUploadSerializer, :root => 'question'

    elsif params[:package_id]
      user = User.where(:uid => params[:uid]).first
      rates = Rating.where(:work_id => params[:work_id])
      work = Work.where(:id =>params[:work_id]).first
      answered_questions = work.questions.where( :id => [rates.collect(&:question_id)] )
      render json:answered_questions

    elsif params[:work_id] && params[:work_id].length > 0

      @current_work =  Work.find(params[:work_id])

      question = NextQuestionService.new({user: current_user, work: @current_work}).next()

      if question
        render json: [question]
      else
        render json: []
      end


    else

      all_questions = Question.all
      render json:all_questions

    end


  end


  def next_question

    if @current_work.testing
      testawork_choice = TestaworkChoice.where(:work_id => @current_work.id,:user_id => current_user.id).first

      if testawork_choice
        return nil
      else
        testawork_package = Package.where(:code => 'testawork').first
        question = Question.where(:package => testawork_package).first
        return question
      end


    end

    unanswered_questions = unanswered_questions(@current_work,current_user)

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


  def update
    @question = Question.find(params[:id])
    respond_to do |format|
      format.json do
        if @question.update(question_params)
          render :json => @question
        else
          render :json => { :errors => @question.errors.messages }, :status => 422
        end
      end
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    respond_to do |format|
      format.json { render :json => {}, :status => :no_content }
    end
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      format.json do
        if @question.save
          uni_phrasing = Phrasing.where(:code => 'universal').first
          @question.phrasing_id = uni_phrasing.id
          @question.save
          render :json => @question
        else
          render :json => { :errors => @question.errors.messages }, :status => 422
        end
      end
    end
  end




  def number_of_ratings_for_current_work_for_ratetype(ratetype)
    current_rate_type_questions = Question.where( :rating_type => ratetype )
    current_work_ratings_for_rate_type = Rating.where(:work_id => @current_work.id, :question_id => [current_rate_type_questions.collect(&:id)])
    current_work_ratings_for_rate_type.count
  end


  def average_score_for_work_for_rate_type(ratetype)

    current_rate_type_questions = Question.where( :rating_type => ratetype )
    current_work_ratings_for_rate_type = Rating.where(:work_id => @current_work.id, :question_id => [current_rate_type_questions.collect(&:id)])
    average_score =  current_work_ratings_for_rate_type.collect(&:score).sum.to_f/current_work_ratings_for_rate_type.length if current_work_ratings_for_rate_type.length > 0
    return average_score

  end


  private

  def question_params
    params.require(:question).permit!
  end



end
