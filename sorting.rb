fruits = ["orange", "apple", "banana", "pear", "grapes"]
fruits.sort! do |fruit1, fruit2|
    fruit2 <=> fruit1
end
