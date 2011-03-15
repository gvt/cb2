# Ruby .OBJ to JSON converter
require "rubygems"
require "json"


  hash = {"vrt" => [], "face" => [], 'norm' => []}
  file = File.open("3d.obj", "r")
  file.each_line("\r") do |line|
      if line[0,2] == "f "
        line.chop!.delete! "f"
        line.strip!
        array = line.split(/ /)
        array.collect!{ |i| i.split(/\//)}
        array.each{ |i| i.collect!{ |j| j.to_i}}
        (hash["face"] ||= []) << array
      elsif line[0,2] == "v "
        line.chop!.delete! "v"
        line.strip!
        array = line.split(/ /)
        array.collect!{ |i| i.to_f } 
        (hash["vrt"] ||= []) << array
      elsif line[0,2] == "vn"
        line.chop!.delete! "vn"
        line.strip!
        array = line.split(/ /)
        array.collect!{ |i| i.to_f } 
        (hash["norm"] ||= []) << array
      else
    end
  end
  hash = hash.to_json
  output = File.new("output.json", "w")
  output.puts "#{hash}"
  output.close

