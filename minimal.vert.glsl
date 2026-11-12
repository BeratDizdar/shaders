#version 430 core

layout(std430, binding = 0) readonly buffer vertex {
    vec2 g_pos[];
};

void main() {
    gl_Position = vec4(g_pos[gl_VertexID], 0, 1);
}
