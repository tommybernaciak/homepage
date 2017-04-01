class StaticContent < ActiveRecord::Base

  def self.about_me
    get_content('me').first.body || ''
  end

  def self.work
    get_content('work').first.body || ''
  end

  def self.get_content type
    where(content_type: type) || []
  end
end
