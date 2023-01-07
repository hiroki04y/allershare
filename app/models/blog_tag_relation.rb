class BlogTagRelation < ApplicationRecord
  belongs_to :blog
  belongs_to :blog_tag
end
