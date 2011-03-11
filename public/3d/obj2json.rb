# Ruby .OBJ to JSON converter

hash = {"vrt" => [], "face" => [], 'norm' => [], 'text'=>[]}
file = File.open("3d.obj", "r")
file.each_line("\r") do |line|
    p line
end


