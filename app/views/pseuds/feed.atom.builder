atom_feed do |feed|
  feed.title "superlove works by '#{@pseud.name}'"
  feed.updated @pseud.works.first.created_at if @pseud.works.respond_to?(:first) && @pseud.works.first.present?

  @pseud.works.each do |work|
    unless work.unrevealed? || work.restricted? || !work.visible?
      feed.entry work do |entry|
        entry.title work.title
        entry.summary feed_summary(work), :type => 'html'

        entry.author do |author|
          author.name text_byline(work, :visibility => 'public')
        end
      end
    end
  end
end
