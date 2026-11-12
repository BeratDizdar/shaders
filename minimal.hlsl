StructuredBuffer<float2> g_pos: register(t0);

float4 vmain(uint id: SV_VertexID): SV_POSITION {
    return float4(g_pos[id], 0, 1);
}

float4 pmain(): SV_TARGET {
    return float4(1, 1, 1, 1);
}
