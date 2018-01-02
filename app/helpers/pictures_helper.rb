module PicturesHelper
  def set_pictures_data
    @pictures.map{ |picture| [picture.image.url(:large), picture.id] }.to_json.html_safe
  end
end
