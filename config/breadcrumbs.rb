crumb :root do
  link "Home", root_path
end

crumb :registrations do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :sessions do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :teams_reg do
  link "学校登録", new_team_path
  parent :root
end

crumb :teams_show do
  link "高校紹介", team_path
  parent :teams_reg
end

crumb :games_reg do
  link "練習試合申し込み", new_game_path
  parent :root
end

crumb :games_index do
  link "練習試合一覧", games_path
  parent :root
end

crumb :games_show do
  link "練習試合詳細", games_path
  parent :games_index
end

crumb :games_search do
  link "地域検索結果", game_search_path
  parent :games_index
end

crumb :games_messages do
  link "メッセージ投稿ページ", game_messages_path
  parent :games_show
end
