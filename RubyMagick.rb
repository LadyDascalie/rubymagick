#!/usr/bin/env ruby

require 'fastimage'  # gem install fastimage
require 'shellwords' # std. library

# input user config
print "Please specify a width (ex 100, 200):\n"
maxWidth = gets.strip.to_i
print "Please specify a filetype (ex. jpg, png):\n"
fileType = gets.strip

# convert uses imagemagick to resize the picture
# while conserving aspect ratio.
#
# To convert to a specific height instead use
# -resize x100 for example (this also preserves aspect ratio)

files = Dir.glob('*.'+fileType);

files.each do |f|
  if (FastImage.size(f)[0] > maxWidth)
    `convert #{f.gsub(/ /, '\ ')} -resize #{maxWidth} #{f.gsub(/ /, '\ ')}`
    print "#{f} has been resized !\n"
  else
    print "#{f} - This image already has the right dimensions !\n"
  end
end
