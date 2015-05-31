load_library :video
include_package 'processing.video'
attr_reader :cam, :my_shader

def setup
  size(640, 480, P2D) 
  cameras = Capture.list
  @my_shader = load_shader('edge_detect.glsl')
  my_shader.set('sketchSize', width.to_f, height.to_f)
  start_capture(width, height)
end

def start_capture(w, h)
  @cam = Capture.new(self, w, h)
  cam.start
end

def draw
  return unless (cam.available == true)
  cam.read
  image(cam, 0, 0)
  return if mouse_pressed?
  filter(my_shader)
end
