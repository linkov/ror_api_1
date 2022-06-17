class Api::V1::TestaworkChoicesController < Api::ApiController
  # before_action :authenticate_user!
  def show
    render json: TestaworkChoice.find(params[:id])
  end


  def index

    render json: TestaworkChoice.all

  end

  def create
    user = User.where(:uid => params[:user_id]).first
    existing_choice_for_picture_user_work = TestaworkChoice.where( :picture_id => params[:picture_id],:work_id => params[:work_id], :user_id => user.id ).first
    if existing_choice_for_picture_user_work
      existing_choice_for_picture_user_work.destroy
    end
    @choice = TestaworkChoice.new(:picture_id => params[:picture_id],:work_id => params[:work_id], :user_id => user.id)
    if @choice.save
      connected_rating = Rating.new(:author => user, :question_id => params[:question_id], :work_id =>  params[:work_id], :score => 50 )
      connected_rating.save()
      work = Work.find(params[:work_id])
      check_testing_state(work)

      render json:@choice
    end
  end


  def stop_testing(work,winner_pic_id)
    pics_to_delete = work.pictures.where.not(:id => winner_pic_id)
    pics_to_delete.destroy_all
    work.testing = false
    work.save!
  end

  def check_testing_state(work)
    work_choices = TestaworkChoice.where(:work => work)
    testawork_limit_setting = Setting.where(:code => 'testawork_limit').first
    if testawork_limit_setting

      if work_choices.count >= testawork_limit_setting.value

        choice_counts_dict = work_choices.group('picture_id').order('count_all').count
        winner_pic_id = choice_counts_dict.max_by{|k,v| v}[0]
        looser_pic_id = choice_counts_dict.min_by{|k,v| v}[0]

        if (winner_pic_id != looser_pic_id)  || choice_counts_dict.length == 1
          stop_testing(work,winner_pic_id)
        end


      end
    end

  end

  def testawork_choice_params
    params.permit(:question_id, :picture_id,:work_id, :user_id)
  end

end
