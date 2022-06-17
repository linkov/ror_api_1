require 'descriptive_statistics'

class Api::V1::ExpertPreviewSerializer < ActiveModel::Serializer
  attributes :keywords, :art_categories, :price, :freereview, :shortbio, :picture,  :id, :name, :about, :email, :uid, :expertises, :shortbio, :tagline, :portfoliopics, :website

  def art_categories
    object.art_categories.collect(&:id)
  end

  def keywords
    "photography reviews, photo critique, "+object.expertises.collect(&:title).map { |e| "#{e}" }.join(', ')
  end

  def expertises
    object.expertises.collect(&:id)
  end

  def portfoliopics
    if object.portfoliopics.length > 0
      arr = object.portfoliopics.order(:order).collect { |pic|
        {
            'id': pic.id,
            'src': pic.picture.url,
            'thumb': pic.picture.url(:thumb),
            'w': pic.width,
            'h': pic.height
         }
      }

    end
  end




end
