include ActiveModel::Serialization

class Work < ActiveRecord::Base
  include PublicActivity::Common

  serialize :pics

  is_impressionable
  has_many :ratings, dependent: :destroy
  has_many :backrates, dependent: :destroy
  has_many :manualflowpics, dependent: :destroy
  belongs_to :user
  belongs_to :work_category
  belongs_to :presentation
  belongs_to :focu
  has_and_belongs_to_many :packages
  has_and_belongs_to_many :questions
  has_many :suggestion_word_choices, dependent: :destroy
  has_many :suggestion_choices, dependent: :destroy
  has_many :testawork_choices, dependent: :destroy
  has_many :suggestion_word_choice_counts, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :bans, dependent: :destroy
  has_many :conversations, dependent: :destroy

  has_one :reviewpayment, dependent: :destroy

  has_and_belongs_to_many :art_categories
  accepts_nested_attributes_for :packages
  mount_uploader :picture, PictureUploader
  mount_uploaders :pics, PicsUploader
  mount_uploader :audio, AudioUploader
  mount_uploader :wavescreenshot, WavescreenshotUploader
  # validates :user_id, presence: true
  # validates :title,  presence: true, length: { maximum: 50 }
  default_scope -> { order(created_at: :desc) }
  after_initialize :set_defaults, unless: :persisted?

  # def self.next_24hours
  #   end_time = Time.zone.now + 1.day
  #   all.select { |work| event.schedule.next_occurrence < end_time }
  # end


  def set_defaults
    self.presentation  ||= Presentation.where(:code => 'scrollview').first
  end

  def has_recent_answered_questions(user)
    user_rates = Rating.where(:author => user,:work_id => self.id)
    user_rates_today = user_rates.where(created_at: (Time.now - 24.hours)..Time.now)

    if user_rates_today.count > 0
      return 1
    else
      return 0
    end
  end

  def inreview
    ratings_count = Rating.where(:work_id => self.id).count
    ratings_count == 0
  end

  def has_unanswered_questions(user)

    if self.id == 2435
        Rails.logger.info "enter has_unanswered_questions"
    end


    user_rates = Rating.where(:author => user,:work_id => self.id)
    single_phrasing = Phrasing.where(:code => 'single').first
    uni_phrasing = Phrasing.where(:code => 'universal').first
    multi_phrasing = Phrasing.where(:code => 'multiple').first

    testawork_choice = TestaworkChoice.where(:work_id => self.id,:user_id => user.id).first
    if testawork_choice && self.testing

      return false
    end

    if self.testing
      return true
    end

    if self.pictures.length > 1
      unanswered_questions = self.questions.where.not( :id => [user_rates.collect(&:question_id)] ).where(:active => true).where(:phrasing_id => [multi_phrasing,uni_phrasing] )

    else
      unanswered_questions = self.questions.where.not( :id => [user_rates.collect(&:question_id)] ).where(:active => true).where(:phrasing_id => [single_phrasing,uni_phrasing] )

    end

    if unanswered_questions && unanswered_questions.count > 0
      return true
    else
      return false
    end

  end


end
