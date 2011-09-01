# encoding: UTF-8

module Feed
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

        def categories
          return [] if @feed.channel.dc_subjects.empty?
          @feed.channel.dc_subjects.collect{|c| c.content}
        end

        def category
          return '' if self.categories.empty?
          self.categories.join(', ')
        end

        def icon
          return '' if @feed.channel.image.nil?
          @feed.channel.image.resource
        end
        alias :logo :icon 

        def rights
          return '' if @feed.channel.dc_rights.nil?
          @feed.channel.dc_rights
        end

        def updated
          return '' if @feed.channel.dc_date.nil?
          @feed.channel.dc_date
        end

      end
    end
  end
end
