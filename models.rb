# Our photo uploader for carrierwave
class PhotoUploader < CarrierWave::Uploader::Base
	storage :file
end

class User < ActiveRecord::Base
	has_many :posts
	mount_uploader :avatar, PhotoUploader
end

class Post < ActiveRecord::Base
	has_one :user
end
