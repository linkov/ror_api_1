require 'descriptive_statistics'

class Api::V1::UserMvpSerializer < ActiveModel::Serializer
  attributes :average_rating, :price, :freereview, :shortbio, :picture, :mvpfreetier, :manualflow, :id, :name, :about, :zip, :country, :email, :password, :guest, :ratings, :temp_uid, :locale, :unread_message_count, :packages, :allow_messaging, :average_rating, :uid, :onboarding, :expertises

  def mvpfreetier
    object.works.count == 0
  end

  def average_rating
    user_works = Work.where(:user => object).collect(&:id)
    all_ratings = Rating.where(:work_id =>user_works)
    average_score =  all_ratings.collect(&:score).mean if all_ratings.length > 0
    qs = Question.where(:id => all_ratings.collect(&:question_id))

    if qs.length > 0

      average_importance_of_questions_answered = qs.collect(&:importance).median

      if average_importance_of_questions_answered > 5

        if average_score <91
          average_score += 5
        end

      else

        if average_score >11
          average_score -= 5
        end

      end

    end



    if !average_score || average_score == 0
      50
    else
      average_score.round
    end

  end

  def expertises
    object.expertises.collect(&:id)
  end

  def ratings
    Rating.where(:author => object).collect(&:id)
  end

  def packages
    object.packages.collect(&:id)
  end

  def unread_message_count
    conversations = Conversation.where("recipient_id = ? or sender_id = ?", object.id, object.id)
    count = Message.where(:conversation_id => conversations.collect(&:id),:read => false).where.not(:user_id => object.id).count
    return count
  end

end
