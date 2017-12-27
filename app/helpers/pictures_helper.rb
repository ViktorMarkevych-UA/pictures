module PicturesHelper
  def set_pictures_data
    @pictures.map{ |picture| [picture.image.url(:large), picture.id] }.to_json.html_safe
  end

  def set_likes_icons(p)
    icon = current_user_liked(p) ? '<i class="glyphicon glyphicon-heart"></i>' : '<i class="glyphicon glyphicon-heart-empty"></i>'
    icon.html_safe
  end

  def current_user_liked(p)
    p.users.include?(current_user)
  end
end
