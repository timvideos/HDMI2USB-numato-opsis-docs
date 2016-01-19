require 'nokogiri'

module Jekyll

  module TOCGenerator

    HIDE_HTML = '<span class="toctoggle">[<a id="toctogglelink" class="internal" href="#">%1</a>]</span>'

    def toc_generate(html)
      doc = Nokogiri::HTML(html)
      return html unless doc.css('div#toc').length > 0

      toc_table = "<div id='toc-container'><table class='toc' id='toc'><tbody><tr><td><div id='toctitle'><h2>Contents</h2></div>#{next_level(doc, doc, 2)}</td></tr></tbody></table></div>"

      doc.css('div#toc').first.replace(toc_table)
      doc.css('body').children.to_xhtml
    end

    private

    def next_level(doc, tags, level, prefix='')
      if level > 5 then
        return ""
      end

      htag = 'h' + level.to_s
      if tags.css(htag).length == 0 then
        return next_level(doc, doc, level+1, prefix)
      end

      level_html = '<ul>'
      i = 0
      tags.css(htag).each do |tag|
        afterthistag = tag.xpath("following::*")
        nexttags = tag.xpath("following::#{htag}")
        if nexttags.length > 0
          afternexttag = nexttags.first.xpath("following::*")
        else
          afternexttag = Nokogiri::XML::NodeSet.new(doc)
        end
        inbetween = afterthistag - afternexttag
        i += 1
        level_html += "<li><a href='##{tag['id']}'><span class='tocnumber'>#{prefix}#{i}</span> <span class='toctext'>#{tag.text.strip}</span></a>"
        level_html += next_level(doc, inbetween, level+1, "#{prefix}#{i}.")
        level_html += '</li>'
      end
      level_html += '</ul>'
    end
  end
end

Liquid::Template.register_filter(Jekyll::TOCGenerator)
