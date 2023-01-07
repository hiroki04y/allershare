class BlogTag < ApplicationRecord
    #blog_tagsテーブルから中間テーブルに対する関連付け
    has_many :blog_tag_relations, dependent: :destroy
    #blog_tagテーブルから中間テーブルを介してArticleテーブルへの関連付け
    has_many :blogs, through: :blog_tag_relations, dependent: :destroy
end
