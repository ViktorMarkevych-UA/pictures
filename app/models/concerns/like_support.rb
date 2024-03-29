module LikeSupport
  extend ActiveSupport::Concern

  class_methods do
    def check_and_manage_likes(picture, current_user, type_1, type_2)
      attrs = { picture_id: picture.id, user_id: current_user.id }
      like = Like.where(attrs).first
      if like.present?
        if like.type == type_1.capitalize + 'Like'
          Object.const_get(type_1.capitalize + 'Like').where(id: like.id).destroy_all     #with 'find' and 'delete' counter_cache is not working
          Object.const_get(type_2.capitalize + 'Like').create(attrs)
        end
      else
        Object.const_get(type_2.capitalize + 'Like').create(attrs)
      end
      { negative_likes: Picture.find(picture.id).negative_likes_count,
        positive_likes: Picture.find(picture.id).positive_likes_count }
    end
  end

end