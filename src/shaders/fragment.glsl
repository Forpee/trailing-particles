uniform float uTime;

varying vec2 vUv;
varying float vAlpha;

void main()
{
    float d=length(gl_PointCoord-vec2(.5,.5));
    float a=1.-smoothstep(0.,.5,d);
    
    gl_FragColor=vec4(1.,1.,1.,a*vAlpha);
}