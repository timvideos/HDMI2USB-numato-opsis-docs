require 'nokogiri'

module Jekyll
  module Converters
    class Markdown < Converter
      alias old_convert_mdinc convert
      @@faq_content = nil

      def convert(content)
        ncontent = nil
        while ncontent != content do
           ncontent = content
           content = content.gsub(/%\[[^\]]*\]/) { |match|
              fpath = File.join(@config["source"], "_includes", "#{match[10..-2]}.md")
              File.read(fpath)
           }
        end
        old_convert_mdinc(content)
      end
    end
  end
end

