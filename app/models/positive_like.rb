class PositiveLike < Like
  belongs_to :picture, counter_cache: true

  def self.manage_like_for(picture, current_user)
    check_and_manage_likes(picture, current_user, 'negative', 'positive')
  end
end
