%% Part 1
figure, imshow(f);

N= 10;
lambda = 0.2;
f1=diffuse1(f,N, lambda);
figure, imshow(f1);

N= 10;
lambda = 0.2;
f1=diffuse1(f,N, lambda);
figure, imshow(f1);

N= 10;
lambda = 0.05;
f1=diffuse1(f,N, lambda);
figure, imshow(f1);

%% Part 2
N = 10;
lambda = 0.2;
K = 1;
for i=1:3
    f1(:,:,i) = diffuse2(f(:,:,i),2, N, lambda, K);
end
figure, imshow(f1);

%% Part 3

S = double(imread('parrot.png'));
mask = imread('parrot-mask.png');
figure, imshow(S/max(S(:)));

for i=1:3
    im(:,:,i) = S(:,:,i).*(mask==255);
end
figure, imshow(im/max(im(:)));

N= 300;
lambda = 0.2;

for i=1:3
    im1(:,:,i) = diffuse3(im(:,:,i), N, lambda, mask);
end
figure, imshow(im1/max(im1(:)));
im1 = diffuse1(im1, 1);
figure, imshow(im1/max(im1(:)));