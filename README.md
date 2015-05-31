filters4ruby-processing
==================
A port of [Filters4Processing][] to ruby-processing
A growing collection of pixel shaders ported to Processing to be used with the `filter()` function. Most of these shaders come from the excellent [Shadertoy](https://www.shadertoy.com) by Iñigo Quilez.

### To run shader sketches
```bash
rp5 --nojruby run/watch sketch.rb # Need to use jruby-complete
```
or in `.rp5rc` add following (if pure yaml)
```yaml
JRUBY: 'false'
```
or if you used our configRP5.pde tool (emits json)
```json
{
"JRUBY": "false",
....
}
```
to avoid need for `--nojruby` flag, NB: delete line, or change back to 'true' when you need to use gems.... 

This is a java/jruby permission thing, and beyond our control
## Filters

### Barrel Blur Chroma
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/BarrelBlurChroma.jpg)

### Barrel & Pincushion
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/BarrelPincushion.png)

### Bicubic Filter
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Bicubic.jpg)

### Bilateral Filter (denoise)
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Bilateral.jpg)

### Contrast, Saturation, Brightness
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/ConSatBri.jpg)

### Dithering
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Dithering.jpg)

### Edge filter
![screenshot](https://github.com/SableRaf/Filters4Processing/blob/master/screenshots/Edge.jpg)

## Usage

This is a minimal example showing how to import shader file in ruby-processing and use it as a filter.

*Note: Some shaders require additional uniforms. For details, refer to the example sketches included.*

```ruby
attr_reader :my_filter, :my_image

def setup
  size(512, 512, P2D)
  # import an image object
  @my_image  = load_image('texture.jpg')
  # load a shader object
  @my_filter = load_shader('shader.glsl')
  # pass the window size to the shader
  my_filter.set('sketchSize', width.to_f, height.to_f)
end

def draw
  background(0)
  # Draw the image on the scene
  image(my_image, 0, 0)
  # Applies the shader to everything that has already been drawn
  return if mouse_pressed?
  filter(my_filter)
end
```

## Notes about porting filters from Shadertoy

Shadertoy and Processing both have their own quirks when it comes to shader programming. We need to make some changes in order to make Shadertoy code work with Processing/ruby-processing.

Replace:
`void mainImage( out vec4 fragColor, in vec2 fragCoord )` -> `void main( void )`

Replace all:
* `iChannel0` -> `texture`
* `fragCoord` -> `gl_FragCoord`
* `fragColor` -> `gl_FragColor`

There is more to it than this but these tips should cover most basic filters.

Now go dig for some [shaders](https://www.shadertoy.com/results?query=filter) and help us extend the library of filters available for Processing/ruby-processing!

*Note: It is possible to port other types of shaders, but this repository focuses on filters.*

## Acknowledgments
Port to processing by Raphaël de Courville.
Thanks to all the Shadertoy contributors for their hard work. This collection wouldn't exist without them. Thanks to Andres Colubri for his work on the Processing Shader API.

## License
All shaders from Shadertoy belong to there respective authors. Unless otherwise specified in the shader file, they are licensed under Creative Commons ([CC BY-NC-SA 3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US))

[Filters4Processing]:https://github.com/SableRaf/Filters4Processing