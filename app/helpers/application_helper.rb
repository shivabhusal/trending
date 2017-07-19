module ApplicationHelper
  def embed_clickable_links_from(text)
    simple_format(text)
      .gsub(URI.regexp, '<a href="\0" target="_blank">\0</a>')
      .html_safe
  end

  def chart_data
    
    text = ''
    @chart_data.each do |key, value|
      text << "{date: '#{key}',\n"
      value.each do |val|
        text << "#{tags_data[val[0][1]]}: #{val.last},\n"
      end
      text << "},\n"
    end

    text
  end

  def tags_data 
     Tag.all.map {|x| [x.id, x.name]}.to_h
  end
end
