; Inputs:   v0   = Position
;           v3   = Normal
;           c0   = Useful constants (0,xxx,xxx,xxx)
;           c1-4 = WorldView matrix
;           c5-9 = WorldViewProjection matrix

vs.1.0                             ; Shader version 1.0
m4x4    r0   , v0   , c1           ; r0 = View space position
m3x3    r1   , v3   , c1           ; r1 = View space normal
m4x4    oPos , v0   , c5           ; Spit out projected position
dp3     r2.x , r0   , r0           ; Normalize r0 (position)
rsq     r2.x , r2.x
mul     r0   , r0   , r2.x
dp3     r3.x , r0   , r1          ; Compute dot product
mad     oD0.w, r3.x , c0.y , c0.y  ; Scale to [0,1] and make alpha
mov     oD0.xyz     , c0.x         ; Diffuse RGB is 0
