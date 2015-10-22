class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :albums
  has_many :images
  has_many :tags
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  # validates :avatar, attachment_presence: true

  def self.untagged(image)
    tagged_users = []
    tagged = image.tags
    tagged.each do |tag|
      tagged_users.push(tag.user)
    end

    untagged = []
    User.all.each do |user|
      if tagged_users.include?(user) == false
        untagged.push(user)
      end
    end
    untagged
  end
end
