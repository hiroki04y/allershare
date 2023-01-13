crumb :root do
  link "TOP", root_path
end

crumb :use do
  link "アレルシェアについて", use_path
  parent :root
end

crumb :blog_search do
  link "ブログを探す", blog_view_path
  parent :root
end

crumb :blog_view do
  link "ブログ編集", blog_view_path
  parent :root
end

crumb :blog_new do
  link "ブログ作成", blog_view_path
  parent :root
end

crumb :user_view do |user|
  link "#{user.name}さんの詳細", users_index_path(user)
  parent :root
end

