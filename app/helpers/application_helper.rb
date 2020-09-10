module ApplicationHelper
  def get_twitter_card_info(post)
    twitter_card = {}
    twitter_card[:url] = "https://nisatume.com/posts/#{post.id}"
    twitter_card[:image] = "https://nisatume.com/img/rogo.png"
    twitter_card[:title] = '二冊目'
    twitter_card[:card] = 'summary_large_image'
    twitter_card[:description] = '本と本をつなげよう'
    twitter_card
  end
end
