# Ruby .OBJ to JSON converter
require "rubygems"
require "json"


  hash = {"vrt" => [], "fac" => [], 'nrm' => []}
  file = File.open("3d.obj", "r")
  file.each_line("\r") do |line|
      if line[0,2] == "f "
        line.chop!.delete! "f"
        line.strip!
        array = line.split(/ /)
        array.collect!{ |i| i.split(/\//)}
        array.each{ |i| i.collect!{ |j| j.to_i}}
        @coord = Array.new
        array.each do |face|
            @coord << face[0] 
        end
        hash["fac"] << @coord
      elsif line[0,2] == "v "
        line.chop!.delete! "v"
        line.strip!
        array = line.split(/ /)
        array.collect!{ |i| i.to_f } 
        hash["vrt"] << array
      elsif line[0,2] == "vn"
        line.chop!.delete! "vn"
        line.strip!
        array = line.split(/ /)
        array.collect!{ |i| i.to_f } 
        hash["nrm"] << array
      else
    end
  end
  hash = hash.to_json
  output = File.new("output2.json", "w")
  output.puts "{\"obj\":[#{hash}], "mat":[{\"r\":150,\"g\":150,\"b\":150,\"t\":"crate.jpg",\"uv\":true,\"res\":100,\"w\":256,\"h\":256}]}"
  output.close

