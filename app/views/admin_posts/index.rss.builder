xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "superlove News"
    xml.description "Latest updates from superlove"
    xml.link admin_posts_url
    
    @admin_posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.content
        xml.pubDate post.created_at.to_fs(:rfc822)
        xml.link admin_post_url(post)
        xml.guid admin_post_url(post)
      end
    end
  end
end

