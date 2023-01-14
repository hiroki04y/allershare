class User < ApplicationRecord
    has_many :chat_message,dependent: :destroy
    has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
    has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

    has_many :personalchat, dependent: :destroy
    has_many :usertags, dependent: :destroy

    validates :name, {uniqueness: true,presence: true}
    validates :email, {uniqueness: true,presence: true}
    validates :password, {presence: true}

    # ユーザーをフォローする
    def follow(user_id)
        follower.create(followed_id: user_id)
    end

    # ユーザーのフォローを外す
    def unfollow(user_id)
        follower.find_by(followed_id: user_id).destroy
    end

    # フォローしていればtrueを返す
    def following?(user)
        following_user.include?(user)
    end
end
