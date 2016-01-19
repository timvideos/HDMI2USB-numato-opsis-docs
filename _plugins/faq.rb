require 'nokogiri'

module Jekyll
  module Converters
    class Markdown < Converter
      alias old_convert_faq convert
      @@faq_content = nil

      def convert(content)
        # read and cache content of _references.md

        if @@faq_content.nil?
          faq_path = File.join(@config["source"], "info/video-info-faq.md")
          doc = Nokogiri::HTML(File.read(faq_path))

          @@faq_content = {}

          doc.css('h2').each do |node|
            @@faq_content[node.attr('id')] = node.inner_text
          end
          doc.css('h3').each do |node|
            @@faq_content[node.attr('id')] = node.inner_text
          end
          doc.css('h4').each do |node|
            @@faq_content[node.attr('id')] = node.inner_text
          end
        end

        @@faq_content.each do |key, value|
            content = content.gsub("[video-info-faq:#{key}]", "[#{value}](/info/video-info-faq.html##{key})")
        end

        old_convert_faq(content)
      end
    end
  end
end

