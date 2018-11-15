require 'rails_helper'

describe CommentsController do

  let(:user) { create :user}

  let(:category) { create :category, user_id: user.id }
  let(:picture) { create :picture, category_id: category.id }

  before :each do
    picture.reload

    sign_in user
  end

  describe '#create' do
    context 'Return instances variables' do
      it 'should return @pictures and @picture' do
        post :create, params: { picture_id: picture.id, comment: { body: 'some text' } }

        expect(picture.comments.length).to eq 1
        expect(assigns(:comment).body).to eq 'some text'
      end
    end
  end
end
