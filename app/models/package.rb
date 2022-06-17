class Package < ActiveRecord::Base
  has_many :rating_types
  has_many :questions, dependent: :destroy
  has_and_belongs_to_many :works
  has_and_belongs_to_many :users
  mount_uploader :image, PackageImageUploader
  mount_uploader :video, PackageVideoUploader
  accepts_nested_attributes_for :questions, :allow_destroy => true
  after_initialize :set_defaults, unless: :persisted?
  belongs_to :work_category


  amoeba do
    enable
    prepend :title => "Copy of "
    include_association :questions
  end

  def set_defaults
    self.price  ||= 0.0
  end

  def clone!
    r = self.dup
    r.title = "#{self.title} #{DateTime.now}"
    r.active = false

    r.save!

    [ :questions ].each do |c|
      self.send( c ).each do |child|
        n = child.dup
        n.package_id = r.id

        n.save!
      end
    end

    return r
  end


  def ratings
    Rating.where(:question_id => self.questions.collect(&:id))
  end

end
