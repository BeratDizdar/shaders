StructuredBuffer<float2> g_Buffer : register(t0);
cbuffer cB : register(b0) 
{
    float4 rgba;
    float2 scr;
};

float4 VSMain(uint vID : SV_VertexID) : SV_POSITION {
    // Normalized Device Coordinates    
    //
    // sx : screen_x/2
    // sy : screen_y/2
    //
    // x         : [0, screen_x] -> [-1, 1]
    // x/sx      : [0, 2]
    // (x/sx)-1  : [-1, 1]
    // y         : [screen_y, 0] -> [-1, 1]
    // (-y/sy)   : [-2, 0]
    // (-y/sy)+1 : [-1, 1]

    float x = g_Buffer[vID].x;
    float y = g_Buffer[vID].y;
    float sx = scr.x/2.0f;
    float sy = scr.y/2.0f;

    return float4((x/sx)-1, (-y/sy)+1, 0.0f, 1.0f);
}

float4 PSMain(float4 pos : SV_POSITION) : SV_TARGET {
    return rgba;
}
