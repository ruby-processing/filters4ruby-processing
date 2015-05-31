# Pixelate effect
# Original shader by simesgreen
# https://www.shadertoy.com/view/4sl3zr
# Ported to Processing by Raphaël de Courville <twitter: @sableRaph>
# Ported to ruby-processing by Martin Prout
# Hold mouse click to show unfiltered image

attr_reader :my_filter, :my_image

def setup
  size(512, 512, P2D)
  @my_image  = load_image('texture.jpg')
  @my_filter = load_shader('pixelate.glsl')
  my_filter.set('sketchSize', width.to_f, height.to_f)
end

def draw
  background(0)
  # Draw the image on the scene
  image(my_image, 0, 0)
  oscillation = map1d(sin(frame_count * 0.005), (-1.0..1.0), (10..30)).floor
  my_filter.set('division', oscillation.to_f) 
  # Applies the shader to everything that has already been drawn
  return if mouse_pressed?
  filter(my_filter)
end
