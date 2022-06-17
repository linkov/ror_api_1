class Rating < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :suggestion_choice
  belongs_to :suggestion_word_choice
  belongs_to :work
  belongs_to :question
  has_one :backrate, dependent: :destroy
  belongs_to :author, class_name: "User"

  after_save :pusher


  def pusher

    if Rails.env.production?

      user = self.work.user

      rates_by_user = Rating.where(:author => user).count
      rates_to_user = Rating.where(:work => user.works).count
      liverate = rates_by_user - rates_to_user
    begin
      Pusher.trigger('gchannel', 'countchange', {
        work_owner: user.uid,
        ratecount: liverate
      })
    rescue Pusher::Error => e
    Rails.logger.error "Pusher error: #{e.message}"
    end

    end



  end


end
