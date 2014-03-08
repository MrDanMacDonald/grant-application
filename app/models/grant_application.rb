class GrantApplication < ActiveRecord::Base  
	
  has_and_belongs_to_many :programs
	belongs_to :user
  belongs_to :organization
  mount_uploader :attachment, AttachmentUploader
  accepts_nested_attributes_for :programs
  accepts_nested_attributes_for :organization
  attr_accessor :custom_grant_type

  def remove_attachment
  	path = "#{Rails.root}/public" + attachment_url
    #http://stackoverflow.com/questions/13352570/delete-folder-after-send-file-in-rails
  	FileUtils.remove_file(path)
    #https://github.com/carrierwaveuploader/carrierwave/issues/401
   	update_attributes(:remove_attachment => true) unless File.exists?(path)
  end

  def self_destruct
    self.destroy
  end

  def change_status(status)
  	change_attributes(status: status)
  end

end