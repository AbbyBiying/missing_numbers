def missing_numbers(given_array)

  # create an array with all numbers to compare to given_array
  all_numbers_array = Array(0..99)

  new_array = Array.new

  # build new_array with all the numbers not included in given_array
  all_numbers_array.each do |num|
    if !(given_array.include? num)
      new_array << num
    end
  end

  final_array = Array.new
  series_array = Array.new

  new_array.each_with_index do |num, index|
    # find series of consecutive numbers in new_array and temporarily store them in series_array
    if num + 1 == new_array[index + 1]
      series_array << num

    # if there is existing series_array, push series_array to final_array (don't forget to push on the last number of the series)
    elsif series_array.any?
      series_array << num
      final_array << series_array
      series_array = Array.new

    # if there is no existing series_array, simply push the number into final_array
    else
      final_array << num
    end
  end

  # update the final_array by replacing array with the first and last number format
  final_array.map! do |num|
    if num.is_a? Array
      "#{num.first}-#{num.last}"
    else
      num
    end
  end

  # finally, join final_array into one comma separated string
  p final_array.join(",")
end

raise StandardError unless (missing_numbers([0,1,3,50]) == "2,4-49,51-99")
raise StandardError unless (missing_numbers([3,50,4]) == "0-2,5-49,51-99")
raise StandardError unless (missing_numbers([99,0]) == "1-98")
raise StandardError unless (missing_numbers([10]) == "0-9,11-99")
raise StandardError unless (missing_numbers([]) == "0-99")
