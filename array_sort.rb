def alphabetize (arr, rev=false)
    arr.sort!
    if rev 
        arr.reverse! 
    end
    puts arr.to_s + "\n"
    return arr
end

numbers = [9,3,4,3,1,3,6,7,3,4,5,6]
alphabetize(numbers)
alphabetize(numbers,true)
puts "==="