class Blog < ApplicationRecord
    validates :title, {presence: true}
    validates :content, {presence: true}
    validates :UserID, {presence: true}

    #blogテーブルから中間テーブルに対する関連付け
    has_many :blog_tag_relations, dependent: :destroy
    #blogテーブルから中間テーブルを介してblog_tagsテーブルへの関連付け
    has_many :blog_tags, through: :blog_tag_relations, dependent: :destroy

end
