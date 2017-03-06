class Ask < ActiveRecord::Base
    has_many :answers
    mount_uploader :image, AskUploader
end
