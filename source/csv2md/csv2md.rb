require "csvtomd"

csv = ENV['POPCLIP_TEXT']

# csv = <<CSV
# head1,head2,head3,head4
# line1-1,line1-2,line1-3,line1-4
# line2-1,line2-2,line2-3,line2-4
# line3-1,line3-2,line3-3,line3-4
# CSV

print CsvToMd.convert(csv)