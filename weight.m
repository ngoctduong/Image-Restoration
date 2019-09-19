function w = weight(S, para, k)
    if(nargin >=2 && para ~= 1 && para ~= 2)
        disp('para must be 1 or 2');
        return;
    end
    
    if(para==1)
        w = exp(-((abs(S.^2))./(k^2)));
    else
        w = 1./(1+((abs(S.^2))./(k^2)));
    end
    
end