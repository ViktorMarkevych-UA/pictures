require 'rails_helper'

describe NegativeLikesController do
  render_views

  let(:json) { JSON.parse(response.body) }

  let(:current_user) { create :user }
  let(:user_1) { create :user }
  let(:user_2) { create :user }

  let(:category) { create :category, user_id: user_1.id }
  let(:picture) { create :picture, category_id: category.id }
  let(:picture_1like) { create :picture, category_id: category.id }

  let(:like_neg) { create :negative_like, picture_id: picture_1like.id, user_id: current_user.id }

  let(:picture_2like) { create :picture, category_id: category.id }
  let(:like_pos1) { create :positive_like, picture_id: picture_2like.id, user_id: user_1.id }
  let(:like_pos2) { create :positive_like, picture_id: picture_2like.id, user_id: current_user.id }

  describe 'Create unlikes POST' do
    before :each do
      sign_in current_user
    end

    context 'when picture is not have any like' do
      it 'should return 1 negative_likes_count' do
        post :create, params: { picture_id: picture.id }, format: :json
        expect(json).to eq(1)
      end
    end

    context 'when picture have a like' do
      it 'should return 1 negative_likes_count' do
        post :create, params: { picture_id: picture_1like.id }, format: :json
        expect(json).to eq(1)
      end

      it 'should return 1 negative_likes_count and 1 positive likes' do
        like_pos1.reload
        like_pos2.reload
        picture_2like.reload

        expect(picture_2like.positive_likes_count).to eq 2
        post :create, params: { picture_id: picture_2like.id }, format: :json
        picture_2like.reload
        expect(json).to eq(1)
        expect(Picture.find(picture_2like.id).positive_likes_count).to eq 1
      end
    end
  end
end
