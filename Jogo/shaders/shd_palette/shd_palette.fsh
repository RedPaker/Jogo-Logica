//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 smplC = texture2D(gm_BaseTexture, v_vTexcoord);
    
    if(smplC.r == (252.0 / 255.0) && smplC.g == (193.0 / 255.0) && smplC.b == (18.0 / 255.0)){
        sample.r = 
    }
}
