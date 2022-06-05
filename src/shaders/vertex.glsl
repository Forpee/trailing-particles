varying vec2 vUv;
varying float vAlpha;
attribute float angle;
attribute float life;
attribute float offset;

uniform float uTime;
uniform vec2 uMouse;

void main()
{
    
    vec3 newpos=position;
    
    float current=mod(offset+uTime,life);
    float percent=current/life;
    
    vAlpha=smoothstep(0.,.05,percent);
    vAlpha-=smoothstep(.85,1.,percent);
    
    float dir=angle+sin(uTime/2.)*.2;
    
    newpos.x+=cos(dir)*current;
    newpos.y+=sin(dir)*current;
    
    vec3 curpos=newpos;
    float mouseRadius=.35;
    float dist=distance(curpos.xy,uMouse);
    
    float strength=dist/mouseRadius;
    strength=1.-smoothstep(0.,1.,strength);
    
    float dx=uMouse.x-curpos.x;
    
    float dy=uMouse.y-curpos.y;
    
    float angleangle=atan(dy,dx);
    
    newpos.x+=cos(angleangle)*strength*.3;
    newpos.y+=sin(angleangle)*strength*.3;
    
    vec4 mvPosition=modelViewMatrix*vec4(newpos,1.);
    gl_PointSize=30.*(1./-mvPosition.z);
    
    gl_Position=projectionMatrix*modelViewMatrix*vec4(newpos,1.);
    
    vUv=uv;
}