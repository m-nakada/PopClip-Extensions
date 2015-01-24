# encoding: utf-8
require 'etc'
require 'fileutils'
require 'syslog'

FIP_DIR = '/Dropbox/fip'
Syslog.open("fip.rb")
input = ENV['POPCLIP_TEXT']

# input = <<"EOS"

# Pierre Vassiliu
# Qui C Est Celui La Album : Master Series (Compilation) (1974)
# EOS

class Exporter
  def initialize(input, dir)
    @input = input
    @dir = dir
  end
  attr_accessor :input, :dir, :content
  
  def prepare_directory
    unless File.directory?(@dir)
      FileUtils.mkdir_p(@dir)
    end
  end

  def prepare_content
    array = []
    @input.each_line do |line|
      next if line == "\n"
      pos = line.rindex(' Album : ')
      if pos then
        line.insert(pos, "\n") 
        line.each_line {|subline| array.push subline.strip}
      else
        array.push line.strip
      end
    end
    @content = array
  end

  def export_content
    path = dir + '/' + Time.new.strftime("%Y-%m-%d").to_s + ".txt"
    File.open(path, 'a+') { |f|
      f << "```\n"
      @content.each {|c| f << c + "\n"}
      f << "```\n"
      f << "\n"
    }
  end

  def print_content
    @content.each {|c| puts c}
  end
  
  def export
    prepare_directory
    prepare_content
    export_content
    # print_content
  end
end

begin
  exporter = Exporter.new(input, "#{Etc.getpwuid.dir}" + FIP_DIR)
  exporter.export
rescue Exception => e
  Syslog.log(Syslog::LOG_WARNING, "Exception: %s", e.message)
ensure
  Syslog.close
end
