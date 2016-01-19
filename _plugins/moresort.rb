module Jekyll

  module MoreSort

    def moresort(input, a, b)
        input.sort do |apple, orange|
          apple_property = item_property(apple, a).to_s + " " + item_property(apple, b).to_s
          orange_property = item_property(orange, a).to_s + " " + item_property(orange, b).to_s

          if !apple_property.nil? && orange_property.nil?
            - order
          elsif apple_property.nil? && !orange_property.nil?
            + order
          else
            apple_property <=> orange_property
          end
        end
    end

  end

end

Liquid::Template.register_filter(Jekyll::MoreSort)
