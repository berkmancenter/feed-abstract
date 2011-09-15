# encoding: UTF-8

module FeedAbstract
  class Channel
    class RDF < RSS

      def language
        return '' if @feed.channel.dc_language.nil?
        @feed.channel.dc_language
      end

      # The authors list as an array.
      def authors
        return [] if @feed.channel.dc_publishers.empty?
        @feed.channel.dc_publishers.reject{|au| au == '' || au.match(/^\s+$/)}
      end

      # The authors list as a string, joined with a comma. 
      def author
        return '' if self.authors.empty?
        self.authors.join(', ')
      end

      # The generator of this feed.
      def generator
        return '' unless @feed.channel.respond_to?(:about)
        if @feed.channel.about.match(/connotea/i)
          return 'Connotea'
        end
        ''
      end

      # The category list as an array.
      def categories
        return [] if @feed.channel.dc_subjects.empty?
        @feed.channel.dc_subjects.collect{|c| c.content}.reject{|c| c == '' || c.match(/^\s+$/)}
      end

      # The category list as a string, joined with a comma.
      def category
        return '' if self.categories.empty?
        self.categories.join(', ')
      end

      # A URL (with or without domain depending on input) to a icon representing this feed.
      def icon
        return '' if @feed.channel.image.nil?
        @feed.channel.image.resource
      end
      alias :logo :icon 

      # Copyright info.
      def rights
        return '' if @feed.channel.dc_rights.nil?
        @feed.channel.dc_rights
      end

      # A Time object representing when this feed was updated, or at least "dated" according to the RDF spec.
      def updated
        return '' if @feed.channel.dc_date.nil?
        @feed.channel.dc_date
      end

    end
  end
end
