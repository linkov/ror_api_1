class Api::V1::WorksController < Api::ApiController

  before_action :authenticate_user!

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    render json: nil, status: :ok

  end

  def index

    if params[:statdetail_presentation]

      @works = Work.where(:id => params[:id])
      render json:@works

    elsif params[:sharedpack]

      @works = Work.where(:user => User.where(:uid =>params[:uid]).first,:sharedpack => true)
      render json:@works

    elsif params[:nextworkquery]


      if params[:excluding_id]
        @works = Work.includes(:packages).where.not(user:current_user).where(is_visible:true).where( 'pictures_count > ?', 0 ).where.not(:id => params[:excluding_id])
      else
        @works = Work.includes(:packages).where.not(user:current_user).where(is_visible:true).where( 'pictures_count > ?', 0 )
      end


      @works = @works.select{ |work| work.has_unanswered_questions(current_user)}
      @works = @works.sort_by{|work| [work.norates? ? 0 : 1, work.created_at] }
      @works = @works.sort {|a,b| a.has_recent_answered_questions(current_user) <=> b.has_recent_answered_questions(current_user)}

      if @works.count >= 1

        if params[:id]
          work = Work.find(params[:id])
          @nextworks = @works.select{ |wrk| wrk[:id] != params[:id]}
          @nextworks =  [@nextworks.first]
          @nextworks = [work] + @nextworks
        else
          @nextworks = @works.sample(2)
        end

        render json:@nextworks, each_serializer: Api::V1::WorkRateflowSerializer, context: {current_user: current_user}
        # render json:@nextwork
      else
        render json:[]
      end


    elsif params[:random_userwork]

      @works = Work.where(user:current_user)
      if @works.count == 0
        render json:[]
      else
        offset = rand(@works.count)
        @nextwork =  @works.offset(offset).first
        render json:[@nextwork]
      end


    elsif params[:introgrid]

      @works = Work.where.not(user:User.find_by_uid(params[:uid])).where(is_visible:true)
      @works = @works.select{ |wrk| wrk.has_unanswered_questions(current_user)}.sort_by(&:created_at).reverse().first(54)
      render json:@works, each_serializer: Api::V1::WorkIntrogridSerializer


    elsif params[:uid]
      user = current_user
      @works = Work.where(user:user)
      if params[:stats_presentation]

        if @works.count == 0
          @works = Work.where(:public => true)
        end

        if params[:mvp]
          @works = @works.where(:manualflow => true)
        end


      end
      # render json: @works, serializer: WorkintroSerializer

      render json: @works


    elsif params[:filtered_ids]

      @works = Work.where(:id => params[:filtered_ids])
      render json:@works

    else

      render json:[]
    end


  end



  def grid_work_representation (works)
    works.collect { |r|
      {
          'id':r.id,
          'pic_small_thumb_url': r.cover.image_url(:small_thumb),
          'pic_thumb_url': r.cover.image_url(:thumb),
          'introtext':''
       }
    }

  end

  def show

    @work = Work.find(params[:id])
    render json:@work

  end


  def rate

    @work = Work.find params[:id]

    q_id =  params[:question_id]
    rating_value =  params[:score]


    @newrating =  Rating.create(
        :question_id=>q_id,
        :work => @work,
        :author => current_user,
        :score => rating_value
    )



    @newrating.validate!
    @newrating.errors.full_messages
    @newrating.save!

    @work.norates = false
    @work.save

    render json: true

  end

  def create

    if not user_signed_in?
      authenticate_user!
      return
    end

    if params[:work][:picture] && (not params[:work][:picture].empty?)

      params[:work][:picture] = convert_to_upload(params[:work][:picture])

    end


    if params[:work][:audio] && (not params[:work][:audio].empty?)

      params[:work][:audio] = convert_to_upload(params[:work][:audio])

    end

    if !params[:work][:package_ids] || params[:work][:package_ids].length == 0

      params[:work][:package_ids] = Package.where(:code => 'classic').pluck(:id)

    else
      params[:work][:package_ids] = Package.where(:id => params[:work][:package_ids]).pluck(:id)
    end




    @work = current_user.works.build(work_params)
    current_user.onboarding = false
    current_user.save!


    if @work.manualflow == true
      photopack = Package.where(:code => "photo")
      if photopack.first
        @work.questions = Question.where(:manualflow => true,:package_id => photopack.first.id)
      end

    end

      if @work.save


        render json: @work
      else
        render json: @work.errors, status: :unprocessable_entity
      end
  end


  def update


    @work = Work.find params[:id]

    if params[:work][:pics]

      pics_arr = []

      params[:work][:pics].each do |hsh|

        pics_arr << convert_to_upload(hsh[1])



      end

      params[:work][:pics] = pics_arr

      # @work.pics = params[:work][:pics]


    end

    if params[:work][:audio] && params[:work][:audio][:data] != nil && params[:work][:audio][:url] == nil

      params[:work][:audio] = convert_to_upload(params[:work][:audio])

    end

    if params[:work][:wavescreenshot] && params[:work][:wavescreenshot][:data] != nil && params[:work][:wavescreenshot][:url] == nil

      params[:work][:wavescreenshot] = convert_to_upload(params[:work][:wavescreenshot])

    end



    if @work.update(work_params)

      if params[:work][:is_visible]
        art_category_names = ArtCategory.where(:id => params[:work][:art_category_ids]).collect(&:title).join(', ')
        @work.create_activity :create, owner: @work.user, params:{work:@work.id,questioncount:@work.questions.count,imagecount:@work.pictures.count,tagnames:art_category_names}
      end


      render json: @work
    else
      render json: @work.errors, status: :unprocessable_entity
    end

  end


  protected

  def convert_to_upload(image)
    image_data = split_base64(image[:data])

    temp_img_file = Tempfile.new("data_uri-upload")
    temp_img_file.binmode
    temp_img_file << Base64.decode64(image_data[:data])
    temp_img_file.rewind

    ActionDispatch::Http::UploadedFile.new({
                                               filename: image[:filename],
                                               type: image_data[:type],
                                               tempfile: temp_img_file
                                           })
  end

  def split_base64(uri_str)
    if uri_str.match(%r{^data:(.*?);(.*?),(.*)$})
      uri = Hash.new
      uri[:type] = $1 # "image/gif"
      uri[:encoder] = $2 # "base64"
      uri[:data] = $3 # data string
      uri[:extension] = $1.split('/')[1] # "gif"
      return uri
    end
  end


  private

  def work_params
    # params.require(:work).permit(:title, :description, :is_visible, :emo_point, :idea_point, :tech_point, :package_ids, :work_category_id, :focu_id, {pics: []})
     params.require(:work).permit!
  end

end
