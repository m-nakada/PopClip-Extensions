input = ENV['POPCLIP_TEXT']
lower = ENV['POPCLIP_OPTION_LOWER']
first = 0
print input.split(/[_\s]+/).map{ |i|
        a,b,c = i.split(/^(.)/)
        if first == 0 && lower
          first = 1
          "#{b.downcase}#{c}"
        else
          first = 1
          "#{b.upcase}#{c}"
        end
      }.join('')

# require 'cgi'

# url = "http://www.colorhexa.com/{query}"
# query = ENV['POPCLIP_TEXT']
# url.sub!(/\{query\}/,CGI.escape(query))

# %x{open "#{url}"}


