require 'rails_helper'

describe NegativeLikesController do
  render_views

  let(:json) { JSON.parse(response.body) }

  let(:current_user) { create :user }
  let(:user_1) { create :user }
  let(:user_2) { create :user }

  let(:category) { create :category, user_id: user_1.id }
  let(:picture) { create :picture, category_id: category.id }

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
  end
end
