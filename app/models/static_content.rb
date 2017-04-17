class StaticContent < ActiveRecord::Base

  def self.get_body type
    content = where(content_type: type)
    return content.empty? ? '' : content.first.body
  end
end
