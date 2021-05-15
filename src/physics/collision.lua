function dotIsColliding(dot, rect)
    return  dot.x > rect.x and
        dot.x < rect.x + rect.w and
        dot.y > rect.y and
        dot.y < rect.y + rect.h
end