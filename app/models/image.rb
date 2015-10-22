class Image < ActiveRecord::Base
  belongs_to :album
  has_many :comments
  belongs_to :user
  has_many :tags
  has_attached_file :picture, styles: { large: '1024 x 768>', display: '640 x 480>', thumb: '200 x 200>' }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates :picture, attachment_presence: true


end
