class Institution < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_secure_password

  validates_processing_of :image
  validate :image_size_validation
 
private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end

  has_one :location
  has_many :clinicals
  has_many :appointments
  has_many :patients, through: :appointments

  def get_details
    details = {}
    details['institution'] = self.as_json(except: [:created_at, :updated_at, :rating, :password_digest])
    details['location'] = location(except: [:created_at, :updated_at])
    details
  end
end
