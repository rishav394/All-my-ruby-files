require "rubygems"
require "rest-client"

url="www.brazzers.com/videos/all-sites/all-pornstars/all-categories/thismonth/bydate/"
intel=RestClient.get(url)

xfile=File.open("brazzers.txt","w")

xfile.write(intel.body)

xfile.close