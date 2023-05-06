function gray = rgb2gray_custom(r,g,b)
% https://au.mathworks.com/help/images/perform-element-wise-operations-on-a-gpu.html
    gray = 0.5*r + 0.25*g + 0.25*b;
end