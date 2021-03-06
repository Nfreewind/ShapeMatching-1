#version 330 core
layout(location = 0) in vec3 pos;
layout(location = 1) in vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 proj;

out vec3 out_normal;

void main(){
    out_normal = normalize((transpose(inverse(model)) * vec4(normal, 1.0)).xyz);
    vec4 model_pos = model * vec4(pos, 1.0);
    vec4 view_pos = view * model_pos; 
    gl_Position = proj * view_pos;
    gl_PointSize = 3.0;

    //pos = model_pos.xyz;
    //normal = out_normal;
} 