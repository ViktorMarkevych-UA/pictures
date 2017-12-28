class PositiveLike < Like
  belongs_to :picture, counter_cache: true

  def self.manage_like_for(picture, current_user)
    like = PositiveLike.where(picture_id: picture.id, user_id: current_user.id).first
    like.present? ? like.delete : PositiveLike.create(picture_id: picture.id, user_id: current_user.id)
    Picture.find(picture.id).positive_likes_count
  end
end
