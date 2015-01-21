# encoding: utf-8
# require 'fileutils'

input=ENV['POPCLIP_TEXT']

# Popclipからで呼びだした場合、File.expand_path()を実行すると、スクリプトが失敗する
# dir = File.expand_path("~/Dropbox/fip/")
# unless File.directory?(dir)
#   FileUtils.mkdir_p(dir)
# end

path = "/Users/m-nakata/Dropbox/fip/" + Time.new.strftime("%Y-%m-%d").to_s + ".txt"
File.open(path, 'a') {|f|
  f << "```\n"
  f << input + "\n"
  f << "```\n"
  f << "\n"
}

print input