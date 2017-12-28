class NegativeLike < Like
  belongs_to :picture, counter_cache: true

  def self.manage_like_for(picture, current_user)
    like = Like.where(picture_id: picture.id, user_id: current_user.id).first
    if like.present?
      if like.type == 'PositiveLike'
        PositiveLike.where(id: like.id).destroy_all
        NegativeLike.create(picture_id: picture.id, user_id: current_user.id)
      end
    else
      NegativeLike.create(picture_id: picture.id, user_id: current_user.id)
    end
    Picture.find(picture.id).negative_likes_count
  end
end
