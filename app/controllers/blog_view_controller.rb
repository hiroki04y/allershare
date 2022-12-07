class BlogViewController < ApplicationController
    def blog_view
        @titles = [
            "乳製品の代替食品",
            "乳製品の表示について",
            "もしものことが起きたら",
            "初期症状と対応",
            "アレルギー事故を減らす",
            "エピペンについて"
        ]
    end
end
