class Feed
  class Abstract
    class Channel
      class RDF < RSSFeed


        def authors
          return [] if @feed.channel.dc_publishers.empty?
          @feed.channel.dc_publishers
        end

        def author
          return '' if self.authors.empty?
          self.authors.join(', ')
        end

        def generator
          return '' unless @feed.channel.respond_to?(:about)
          if @feed.channel.about.match(/connotea/i)
            return 'Connotea'
          end
          ''
        end

      end
    end
  end
end
