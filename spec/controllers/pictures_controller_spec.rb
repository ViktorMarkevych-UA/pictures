require 'rails_helper'

describe PicturesController do

  let(:user) { create :user}

  let(:category) { create :category, user_id: user.id }
  let(:picture) { create :picture, category_id: category.id }
  let(:comment) { create :comment, picture_id: picture.id, user_id: user.id }
  let(:picture_c1_2) { create :picture, category_id: category.id }

  let(:category_2) { create :category, user_id: user.id }
  let(:picture_c2) { create :picture, category_id: category_2.id }

  before :each do
    picture.reload
    comment.reload
    picture_c1_2.reload
    picture_c2.reload

    sign_in user
  end

  describe '#index' do
    context 'Return instances variables' do
      it 'should return @pictures' do
        get :index
        expect(assigns(:pictures).count).to eq 3
        expect(assigns(:pictures)).to eq [picture, picture_c1_2, picture_c2]
      end
    end
  end

  describe '#show' do
    context 'Return instances variables' do
      it 'should return @pictures and @picture' do
        get :show, params: { id: picture.id }
        expect(assigns(:picture)).to eq picture
        expect(assigns(:pictures).count).to eq 1
        expect(assigns(:pictures)).to eq [picture_c1_2]
      end

      it 'should return 1 comment for @picture' do
        get :show, params: { id: picture.id }

        expect(assigns(:comments).length).to eq 1
      end
    end
  end
end
