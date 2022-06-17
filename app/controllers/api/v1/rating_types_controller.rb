class Api::V1::RatingTypesController < Api::ApiController
  before_action :authenticate_user!


  @week1_rates_var = nil
  @week2_rates_var = nil
  @week3_rates_var = nil
  @week4_rates_var = nil
  @workfilter  = nil


  def weekly_charts

    @workfilter = params[:workfilter]
    chart = [week1_rates,week2_rates,week3_rates,week4_rates]

    render json:chart

  end

  def overall_stats

    @workfilter = params[:workfilter]

    render json:{overall_average:average,ratecount:ratingcount}

  end

  def show

    if params[:workfilter] && params[:workfilter].length > 0

      render json: RatingType.find(params[:id]), filter: params[:workfilter]
    else
      render json: RatingType.find(params[:id])
    end


  end

  def index



      if params[:id]
        @rtype = RatingType.find(params[:id])

        if params[:workfilter] && params[:workfilter].length > 0
          render json:@rtype, filter: params[:workfilter]
        else
          render json:@rtype
        end




      else



        if params[:workfilter] && params[:workfilter].length > 0

        @rtypes = RatingType.all

        if params[:package_id] && params[:package_id].length > 0
          @rtypes = RatingType.where(:package => params[:package_id])


        else

          default_package = Package.where(:code =>"classic").first
          @rtypes = RatingType.where(:package => default_package)
        end

        render json:@rtypes, filter: params[:workfilter]

        else



        @rtypes = RatingType.all

        if params[:package_id] && params[:package_id].length > 0
          @rtypes = RatingType.where(:package => params[:package_id])


        else

          default_package = Package.where(:code =>"classic").first
          @rtypes = RatingType.where(:package => default_package)
        end

        ids_arr = []
        @rtypes.map do |hash|
          ids_arr << { id: hash[:id] }
        end

        render json:ids_arr


        end

      end






  end










  private

  def ratingcount

    classic_pack = Package.where(:code =>'classic')
    classic_rate_types_ids = RatingType.where(:package =>classic_pack).pluck(:id)


      if @workfilter

        all_ratings = Rating.where(:work_id => @workfilter,:question_id =>[Question.where(:rating_type_id => classic_rate_types_ids).pluck(:id)])

      else

        all_ratings = Rating.where(:work_id => [Work.where(:user => current_user).pluck(:id)],:question_id =>[Question.where(:rating_type_id =>classic_rate_types_ids).pluck(:id)])
        # all_ratings = Rating.all.select('rating.*,COUNT(id)')


      end






    if all_ratings
      all_ratings.count
    else
      0
    end
  end


  def average

    classic_pack = Package.where(:code =>'classic')
    classic_rate_types_ids = RatingType.where(:package =>classic_pack).pluck(:id)


    if @workfilter


      if @overall_rating_for_all_types_work_filter == nil
        all_ratings = Rating.where(:work_id => @workfilter,:question_id =>[Question.where(:rating_type_id => classic_rate_types_ids).pluck(:id)])
        average_score =  all_ratings.collect(&:score).sum.to_f/all_ratings.length if all_ratings.length > 0
        @overall_rating_for_all_types_work_filter = average_score
      else
        average_score =  @overall_rating_for_all_types_work_filter

      end


    else


      if @overall_rating_for_all_types == nil

        all_ratings = Rating.where(:work_id => [Work.where(:user => current_user).pluck(:id)],:question_id =>[Question.where(:rating_type_id => classic_rate_types_ids).pluck(:id)])
        average_score =  all_ratings.collect(&:score).sum.to_f/all_ratings.length if all_ratings.length > 0
        @overall_rating_for_all_types = average_score
      else

        average_score =  @overall_rating_for_all_types

      end




    end


    if average_score && average_score != 0
      average_score.ceil
    else
      50
    end

  end

  def week1_rates
    time_range = (1.weeks.ago..Time.now)


    if @workfilter

      if @week1_rates_var == nil
        all_ratings = Rating.where(:created_at => time_range, :work_id => @workfilter)
        @week1_rates_var = all_ratings

      else

        all_ratings = @week1_rates_var

      end


    else

      if @week1_rates_var == nil
        all_ratings = Rating.where(:created_at => time_range, :work_id => [Work.where(:user => current_user).collect(&:id)])
        @week1_rates_var = all_ratings


      end

      all_ratings = @week1_rates_var


    end

    if all_ratings
      all_ratings.count
    else
      0
    end


  end

  def week2_rates
    time_range = (2.weeks.ago..1.weeks.ago)


    if @workfilter

      if @week2_rates_var == nil
        all_ratings = Rating.where(:created_at => time_range, :work_id => @workfilter)
        @week2_rates_var = all_ratings

      else

        all_ratings = @week2_rates_var

      end


    else

      if @week2_rates_var == nil
        all_ratings = Rating.where(:created_at => time_range, :work_id => [Work.where(:user => current_user).collect(&:id)])
        @week2_rates_var = all_ratings


      end

      all_ratings = @week2_rates_var


    end

    if all_ratings
      all_ratings.count
    else
      0
    end


  end


  def week3_rates
    time_range = (3.weeks.ago..2.weeks.ago)


    if @workfilter

      if @week3_rates_var == nil
        all_ratings = Rating.where(:created_at => time_range, :work_id => @workfilter)
        @week3_rates_var = all_ratings

      else

        all_ratings = @week3_rates_var

      end


    else

      if @week3_rates_var == nil
        all_ratings = Rating.where(:created_at => time_range, :work_id => [Work.where(:user => current_user).collect(&:id)])
        @week3_rates_var = all_ratings


      end

      all_ratings = @week3_rates_var


    end

    if all_ratings
      all_ratings.count
    else
      0
    end


  end


  def week4_rates
    time_range = (4.weeks.ago..3.weeks.ago)


    if @workfilter

      if @week4_rates_var == nil
        all_ratings = Rating.where(:created_at => time_range, :work_id => @workfilter)
        @week4_rates_var = all_ratings

      else

        all_ratings = @week4_rates_var

      end


    else

      if @week4_rates_var == nil
        all_ratings = Rating.where(:created_at => time_range, :work_id => [Work.where(:user => current_user).collect(&:id)])
        @week4_rates_var = all_ratings


      end

      all_ratings = @week4_rates_var


    end

    if all_ratings
      all_ratings.count
    else
      0
    end


  end


end
