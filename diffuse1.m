function res = diffuse1(I, N, lambda)

    if (nargin < 3)
        lambda = 0.2;
    else
        if (nargin == 3 && lambda >= 0.25)
            disp('lambda must not be always lower than 0.25');
            return;
        end 
    end
    
    res = I;
    [m,n,z] = size(I);
    for t=1:z
        for i=1:N
            resLx = [res(:,1,t) res(:,1:n-1,t)];
            resRx = [res(:,2:n,t) res(:,n,t)];

            resLy = [res(1,:,t);res(1:m-1,:,t)];
            resRy = [res(2:m,:,t);res(m,:,t)];

            res(:,:,t) = res(:,:,t)+ lambda.*(resLx-(2.*res(:,:,t))+resRx+resLy+resRy);
        
        end
    end
end