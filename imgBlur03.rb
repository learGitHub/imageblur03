
class Image

  def initialize (picture)
    @picture = picture
  end

  def output_image
    @picture.each do |row|
      puts row.join {|row| print row}
    end
  end

  def identify
    ident_pos = []
    @picture.each_with_index do |row, y_dx|
      row.each_with_index do |num, x_dx|
         #puts "#{ro_idx} - #{nu_idx} - #{num}"
         ident_pos << [y_dx, x_dx] if num == 1
         #print "found_ones: #{blur_pos}" if num == 1
      end  
    end 
    ident_pos
  end

  def blur(dist)
    ident_pos = identify
    @picture.each_with_index do |row, y_dx|
      row.each_with_index do |num, x_dx|
        ident_pos.each do |id_y_dx, id_x_dx|
          if mdist(x_dx, id_x_dx, y_dx, id_y_dx) <= dist
            @picture[y_dx][x_dx] = 1
          end
        end  
      end  
    end
  end  


  def mdist(x1, x2, y1, y2)
    x_d = (x2 - x1).abs
    y_d = (y2 - y1).abs
    x_d + y_d
  end
  
#  blur_pos.each do |pos|
#    x = pos[1] 
#    y = pos[0] 
#    @picture[y][x + 1] = 1 if x + 1 <= @picture[y].length - 1
#    @picture[y][x - 1] = 1 if x - 1 >= 0
#    @picture[y + 1][x] = 1 if y + 1 <= @picture.length - 1
#    @picture[y - 1][x] = 1 if y - 1 >= 0
#  end
  
end

image = Image.new([ 
  [0, 0, 0, 0, 0, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0, 0, 0], 
  [0, 0, 1, 0, 0, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0, 0, 0], 
  [0, 0, 0, 0, 0, 0, 0, 1] 
])

image.blur(2)
image.output_image

