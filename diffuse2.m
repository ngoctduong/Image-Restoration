function res = diffuse2(I, para, N, lambda, K)

    if (nargin < 4)
        lambda = 0.2;
    else
        if (nargin >= 4 && lambda >= 0.25)
            disp('lambda must be always lower than 0.25');
            return;
        end 
    end
    
    if(nargin >=2 && para ~= 1 && para ~= 2)
        disp('para must be 1 or 2');
        return;
    end
    
    res = I;
    [m,n] = size(I);
    for i=1:N
           
        resS = [res(:,1) res(:,1:n-1)] - res;
        resS = resS .* weight(resS, para, K);
        
        resN = res - [res(:,2:n) res(:,n)];
        resN = resN .* weight(resN, para, K);
        
        resE = [res(1,:);res(1:m-1,:)] - res;
        resE = resE .* weight(resE, para, K);
        
        resW = res - [res(2:m,:);res(m,:)];
        resW = resW .* weight(resW, para, K);

        res = res+ lambda.*(resS-resN + resE-resW);
    end
end