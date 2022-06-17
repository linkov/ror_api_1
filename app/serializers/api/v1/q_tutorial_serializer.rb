
class Api::V1::QTutorialSerializer < ActiveModel::Serializer
  attributes :id, :proficiency, :time, :title, :text, :link, :placeholder, :price, :providercode, :providericon

  def providercode
    object.tutorial_type.code
  end

  def providericon
    object.tutorial_type.icon
  end

  def link
    if object.link
      object.link
    end

  end

  def proficiency
    object.proficiency_id
  end

  def parse_video_url(url)
      @url = url

      youtube_formats = [
          %r(https?://youtu\.be/(.+)),
          %r(https?://www\.youtube\.com/watch\?v=(.*?)(&|#|$)),
          %r(https?://www\.youtube\.com/embed/(.*?)(\?|$)),
          %r(https?://www\.youtube\.com/v/(.*?)(#|\?|$)),
          %r(https?://www\.youtube\.com/user/.*?#\w/\w/\w/\w/(.+)\b)
        ]

      vimeo_formats = [%r(https?://vimeo.com\/(\d+)), %r(https?:\/\/(www\.)?vimeo.com\/(\d+))]

      @url.strip!

      if @url.include? "youtu"
        youtube_formats.find { |format| @url =~ format } and $1
        @results = {provider: "youtube", id: $1}
        @results
      elsif @url.include? "vimeo"
        vimeo_formats.find { |format| @url =~ format } and $1
        @results = {provider: "vimeo", id: $1}
        @results
      else
        return nil # There should probably be some error message here
      end
  end

end
