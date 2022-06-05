varying vec2 vUv;
attribute float angle;

uniform float uTime;

void main()
{
    
    vec3 newpos=position;
    
    newpos.x+=cos(angle)*uTime*.5;
    newpos.y+=sin(angle)*uTime*.5;
    
    vec4 mvPosition=modelViewMatrix*vec4(newpos,1.);
    gl_PointSize=10.*(1./-mvPosition.z);
    
    gl_Position=projectionMatrix*modelViewMatrix*vec4(newpos,1.);
    
    vUv=uv;
}