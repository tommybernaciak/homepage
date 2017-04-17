class Post < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  validates :title, :short_intro, :body, presence: true
  before_save :publish

  def self.all_published
    where(published: true)
  end

  def self.sorted_by_publish_date
    (all_published.sort_by &:published_at).reverse || []
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def self.filtered(show_all)
    if show_all == 'true'
      sorted_by_publish_date
    else
      sorted_by_publish_date.first(5)
    end
  end

  def publish
    self.published_at = DateTime.now if self.published
  end

  def published_date
    published_at.strftime('%b %d, %Y')
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
