class NegativeLike < Like
  belongs_to :picture, counter_cache: true

  def self.manage_like_for(picture, current_user)
    like = NegativeLike.where(picture_id: picture.id, user_id: current_user.id).first
    like.present? ? like.delete : NegativeLike.create(picture_id: picture.id, user_id: current_user.id)
    Picture.find(picture.id).negative_likes_count
  end
end
