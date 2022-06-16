a =  [2,20,1,"/a","/c"]
b = [1,"/c/a/","/b","/a",50]
c = 1

puts b.include? c
puts "#{ a & b}"
puts "#{a - b}"
    

