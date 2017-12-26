class PicturesController < ApplicationController

  def index
    pictures =
        if params[:category_id]
          Picture.where(:category_id => params[:category_id]).order("likes_count DESC")
        else
          Picture.order("likes_count DESC").all
        end

    # @pictures = pictures.collect{ |pic| [pic.image.url(:large).html_safe, pic.id, Rails.root.to_s + 'public/' + Paperclip::Geometry.from_file(pic.image.url(:large).split('?')).first.width.to_i] }
    @pictures = pictures.each_with_object([]) do |picture, result|
      result << [picture.image.url(:large).html_safe, picture.id]
      p '*'*100
      p picture.image.url(:large)
      # p Paperclip::Geometry.from_file(Rails.root.to_s + '/public' + picture.image.url(:original).split('?')[0])
      p '*'*100
    end
  end

  def show
    @picture = Picture.preload(comments: :user).find(params[:id])
  end

end