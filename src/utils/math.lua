function normalize (val, min, max)
    return (val - min) / (max - min)
end

function color(r,g,b)
    local resR = normalize(r, 0, 255)
    local resG = normalize(g, 0, 255)
    local resB = normalize(b, 0, 255)
    return resR, resG, resB
end