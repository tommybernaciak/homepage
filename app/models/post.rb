class Post < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  validates :title, :short_intro, :body, presence: true
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

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts.sorted_by_publish_date
  end

  def updated_date
    updated_at.strftime('%b %d, %Y')
  end

  def published_date
    published_at.strftime('%b %d, %Y')
  end

  def publish
    update(published: !published)
    update(published_at: DateTime.now) if published
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip.downcase).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
end
