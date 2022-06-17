class User < ActiveRecord::Base
  include PublicActivity::Common

  # Include default devise modules.
  devise :database_authenticatable, :registerable, :omniauthable,
          :recoverable, :rememberable, :trackable


  include DeviseTokenAuth::Concerns::User



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable


  has_and_belongs_to_many :expertises
  has_and_belongs_to_many :art_categories
  has_and_belongs_to_many :packages
  has_and_belongs_to_many :promo_messages
  has_many :ratings, foreign_key: :author_id, dependent: :destroy
  has_many :works, dependent: :destroy
  has_many :testawork_choices, dependent: :destroy
  has_many :suggestion_word_choices, dependent: :destroy
  has_many :conversations
  has_many :questions
  has_many :bans, dependent: :destroy

  has_many :portfoliopics, dependent: :destroy

  has_many :suggestion_choices, dependent: :destroy
  mount_uploader :picture, PictureUploader

  has_and_belongs_to_many :webnotificationflows

  accepts_nested_attributes_for :ratings
  accepts_nested_attributes_for :expertises
  accepts_nested_attributes_for :art_categories
  accepts_nested_attributes_for :portfoliopics, :allow_destroy => true


  def token_validation_response
    Api::V1::UserSerializer.new(self)
  end

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #
  validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, :unless => lambda {|u| u.password.nil?}


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def ratecount
    rates_by_user = Rating.where(:author => self).count
    rates_to_user = Rating.where(:work => self.works).count
    liverate = rates_by_user - rates_to_user
  end

  def score
    user_works = Work.where(:user => self).collect(&:id)
    all_ratings = Rating.where(:work_id =>user_works)
    average_score =  all_ratings.collect(&:score).sum.to_f/all_ratings.length if all_ratings.length > 0

    if !average_score || average_score == 0
      50
    else
      average_score.round
    end

  end

  # def self.from_omniauth(auth)
  #   Rails.logger.info "auth info"
  #   Rails.logger.info auth
  #
  #   where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
  #     user.email = auth[:info][:email]
  #     user.password = auth[:password]
  #     user.name =auth[:info][:name]  # assuming the user model has a name
  #
  #   end
  # end

end
