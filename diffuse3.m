function res = diffuse3(I, N, lambda, mask)

    if (nargin < 3)
        lambda = 0.2;
    else
        if (nargin >= 3 && lambda >= 0.25)
            disp('lambda must be always lower than 0.25');
            return;
        end 
    end
    
    res = I;
    [m,n] = size(I);
    for i=1:N
        resLx = [res(:,1) res(:,1:n-1)];
        resRx = [res(:,2:n) res(:,n)];

        resLy = [res(1,:);res(1:m-1,:)];
        resRy = [res(2:m,:);res(m,:)];

        res = res+ lambda.*(resLx+resRx+resLy+resRy-(4.*res));

        res(mask==255) = I(mask==255);
    end
end