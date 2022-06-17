class Api::V1::Admin::QTutorialsController < Api::ApiController

  before_action :authenticate_user!


  def destroy
    rec = QTutorial.find(params[:id])
    rec.destroy
    render json: rec
  end


  def create
    params[:q_tutorial][:placeholder] = convert_to_upload(params[:q_tutorial][:placeholder])
    rec = QTutorial.create(q_tutorial_params)
    render json:rec, serializer: Api::V1::QTutorialAdminSerializer, :root => 'q_tutorial'
  end


  def update
    if params[:q_tutorial][:placeholder][:data]
      params[:q_tutorial][:placeholder] = convert_to_upload(params[:q_tutorial][:placeholder])
    else
      params[:q_tutorial].delete :placeholder
    end

    rec = QTutorial.find(params[:id])
    rec.update(q_tutorial_params)
    render json:rec, serializer: Api::V1::QTutorialAdminSerializer, :root => 'q_tutorial'
  end


  def show
    @tut =  QTutorial.find(params[:id])
    render json:@tut, serializer: Api::V1::QTutorialAdminSerializer, :root => 'q_tutorial'
  end


  def index
    render json:QTutorial.all, each_serializer: Api::V1::QTutorialAdminSerializer
  end

  def q_tutorial_params
    params.require(:q_tutorial).permit!
  end

  protected

  def convert_to_upload(image)
    image_data = split_base64(image[:data])

    temp_img_file = Tempfile.new("data_uri-upload")
    temp_img_file.binmode
    temp_img_file << Base64.decode64(image_data[:data])
    temp_img_file.rewind

    ActionDispatch::Http::UploadedFile.new({
      filename: image[:name],
      type: image[:type],
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

end
