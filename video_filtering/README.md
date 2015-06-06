### Experiment with different edge-detection algorithms
In the provided example the the `EDGE_FUNC` is
`define EDGE_FUNC edge`

Alternatives are `colorEdge, trueColorEdge`


In the provided example the sketch uses a sobel filter algorithm

`#define SOBEL`

Alernatives are `KAYYALI_NESW, KAYYALI_SENW, PREWITT, ROBERTSCROSS, SCHARR`

Modify `edge_detect.glsl` directly to use these alternative algorithms included in the shader.

Other tunable option to experiment is `SCHARR`, that defaults to `1.0` for STEP but if `#define SCHARR` sets step at `0.15`
 
