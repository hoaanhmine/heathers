#pragma header
//its important to have this bit here. it inits all the importan OpenFL shader shits like the image's coordinates and size.

vec2 uv = openfl_TextureCoordv.xy;
// uv: coordinate of a pixel. usually replaces 'fragCoord.xy / iResolution.xy';


uniform sampler2D c1;

uniform float offset1;
uniform vec2 pos;

void main(void){

vec4 char1 = texture2D( c1, uv);




    vec4 img = texture2D( bitmap, uv);
    gl_FragColor = char1;
}