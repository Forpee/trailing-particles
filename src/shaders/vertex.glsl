varying vec2 vUv;
varying float vAlpha;
attribute float angle;
attribute float life;
attribute float offset;

uniform float uTime;

void main()
{
    
    vec3 newpos=position;
    
    float current=mod(offset+uTime,life);
    float percent=current/life;
    
    vAlpha=smoothstep(0.,.05,percent);
    vAlpha-=smoothstep(.85,1.,percent);
    
    newpos.x+=cos(angle)*current;
    newpos.y+=sin(angle)*current;
    
    vec4 mvPosition=modelViewMatrix*vec4(newpos,1.);
    gl_PointSize=30.*(1./-mvPosition.z);
    
    gl_Position=projectionMatrix*modelViewMatrix*vec4(newpos,1.);
    
    vUv=uv;
}