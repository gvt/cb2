# Ruby .OBJ to JSON converter
require "rubygems"
require "json"


  hash = {"vrt" => [], "fac" => [], 'nrm' => [], 'tex' =>[]}
  file = File.open("desk.obj", "r")
  ##############("\r")
  file.each_line do |line|
      if line[0,2] == "f "
        line.chop!.delete! "f"
        line.strip!
        array = line.split(/ /)
        array.collect!{ |i| i.split(/\//)}
        array.each{ |i| i.collect!{ |j| j.to_f}}
        @coord = Array.new
        array.each do |face|
          real_face = face[0] - 1
          @coord << real_face 
        end
        @coord << 0
        hash["fac"] << @coord

      elsif line[0,2] == "v "
        line.chop!.delete! "v"
        line.strip!
        array = line.split(/ /)
        array.collect!{ |i| i.to_f }
        if array[0] == nil
          put "HEY"
        end 
        hash["vrt"] << array
      elsif line[0,2] == "vn"
        line.chop!.delete! "vn"
        line.strip!
        array = line.split(/ /)
        array.collect!{ |i| i.to_f } 
        hash["nrm"] << array
        hash["nrm"] << array
      elsif line[0,2] == "vt"
        line.chop!.delete! "vt"
        line.strip!
        array = line.split(/ /)
        array.collect!{ |i| i.to_f }
        array.delete_at(2)
        hash["tex"] << array
    end
  end
  hash = hash.to_json
  output = File.new("output2.json", "w")
  output.puts "{\"obj\":[#{hash}]}"
  output.close

