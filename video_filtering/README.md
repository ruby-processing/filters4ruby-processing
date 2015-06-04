### Experiment with different edge-detection algorithms
In the provide example the sketch uses a sobel filter

`#define SOBEL`

Alernatives are `KAYYALI_NESW, KAYYALI_SENW, PREWITT, ROBERTSCROSS, SCHARR`

Modify `edge_detect.glsl` directly to use these alternative algorithms included in the shader.
