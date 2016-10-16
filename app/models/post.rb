class Post < ActiveRecord::Base
  validates :title, :body, presence: true
  before_create :init_publish_date

  def init_publish_date
    self.published_at = DateTime.now
  end

  def self.published
    where(published: true)
  end

  def self.sorted_by_update_date
    (all.sort_by &:updated_at).reverse || []
  end

  def self.sorted_by_publish_date
    (published.sort_by &:published_at).reverse || []
  end

  def updated_date
    updated_at.strftime('%b %d, %Y')
  end

  def published_date
    published_at.strftime('%b %d, %Y')
  end

  def short_intro
    body.truncate(80)
  end

  def publish
    puts 'publish'
    puts published
    update(published: !published)
    update(published_at: DateTime.now) if published
    puts published
    puts published_at
  end
end