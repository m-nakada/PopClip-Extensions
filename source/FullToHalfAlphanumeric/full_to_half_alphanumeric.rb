# encoding: utf-8
require 'nkf'
require 'syslog'

input = ENV['POPCLIP_TEXT']

# Test
# input = <<TEST
# １２３４５６７８９０
# ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ
# ，．：；？！´｀＾＿—／＼｜‘’“”（）［］｛｝〈〉＋−＝＜＞＄％＃＆＊＠
# あいうえお
# アイウエオ 
# TEST

begin
  Syslog.open("PopClip:FullToHalfAlphanumeric")
  print NKF::nkf '--utf8 -Z0', input
rescue Exception => e
  Syslog.warning("Exception: %s", e.message)
ensure
  Syslog.close
end
