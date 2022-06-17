class Api::V1::PicturesController < ApplicationController

  before_action do

    if params[:work_id]
      @work = Work.find(params[:work_id])
    end
  end


  def pic_order
    Rails.logger.info params[:id]
    Rails.logger.info params[:pic_order]

    dict = params[:pic_order]

    dict.each do |pic_id, pic_order|

      pic = Picture.find(pic_id)
      pic.order = pic_order
      pic.save!

    end

    render json: params
  end

  def destroy
    @pic= Picture.find params[:id]
    @pic.destroy
    render json: @pic
  end

  def index

    @focus = Picture.where(:work_id => params[:work_id])
    render json:@focus
  end

  def show
    render json: Picture.where(:id => params[:id])
  end

  def create
    params[:picture][:image] = convert_to_upload(params[:picture][:image])

    @picture  = @work.pictures.new(picture_params)

    if @picture.save
      render json:@picture
    else
      render :json => { :errors => @picture.errors.full_messages }, :status => 422
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
  def picture_params
    params.require(:picture).permit!
  end

end
