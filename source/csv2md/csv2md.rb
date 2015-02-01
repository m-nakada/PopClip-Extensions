# encoding: UTF-8
# Convert CSV to Markdown table format
require "csv"

csv = ENV['POPCLIP_TEXT']

# csv = <<CSV
# head1,head2,head3,head4
# line1-1,line1-2,line1-3,line1-4
# line2-1,line2-2,line2-3,line2-4
# line3-1,line3-2,line3-3,line3-4
# CSV


# Print Markdown table
headers, *rows = CSV.parse(csv)

print '|'
headers.each do |h|
  print "#{h}|"
end
print "\n"

print '|'
headers.each do |h|
  print '-' * 3
  print '|'
end
print "\n"

rows.each do |r|
  print '|'
  r.each do |c|
    print "#{c}|"
  end
  print "\n"
end
