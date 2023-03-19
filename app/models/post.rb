class Post < ApplicationRecord
validates :title, presence: true
validates :content, length: { minimum: 250 }
validates :summary, length: { maximum: 250 }
validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
validate :sufficiently_clickbait_y_title

def sufficiently_clickbait_y_title
  unless title =~ /(Won't Believe|Secret|Top \d|Guess)/
    errors.add(:title, "must be sufficiently clickbait-y")
  end
end

end
