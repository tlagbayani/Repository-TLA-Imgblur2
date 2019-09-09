# Image Blur #2: Perform an Image Transformation

class Image

  # clear arrays for the image
  def initialize (icon)
    @icon = icon
  end

  # identify the coordinates of the pixel with "1"
  def get_ones
    ones = []
    @icon.each_with_index do |row, row_index|
      row.each_with_index do |item, col_index|
        if item == 1
          ones << [row_index, col_index]
        end
      end
    end
    ones
  end

  # blur transformation routine
  def blur!
    ones = get_ones
      @icon.each_with_index do |row, row_index|
        row.each_with_index do |item, col_index|
          ones.each do |found_row_index, found_col_index|

            if row_index == found_row_index && col_index == found_col_index
              @icon[row_index -1][col_index] = 1 unless row_index == 0 #up
              @icon[row_index +1][col_index] = 1 unless row_index >= 5 #down
              @icon[row_index][col_index -1] = 1 unless col_index == 0 #left
              @icon[row_index][col_index +1] = 1 unless col_index >= 3 #right
            end
          end
        end
      end
  end

  # displays the image on screen
  def output_image
    @icon.each do |data|
      puts data.join
    end
  end
end

#defines image arrays
image = Image.new([
[0, 0, 0, 0],
[0, 0, 0, 0],
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 0],
[0, 0, 0, 0]
])

#output original image
puts "original image:"
image.output_image

#blur the pixels
image.blur!

#output blurred image
puts "blurred image:"
image.output_image
