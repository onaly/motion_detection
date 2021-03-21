clear all;

im0='tree_div0.bmp';
im1='tree_div1.bmp';
lambda=1e-4;
eps=1e-3;
A=double(rgb2gray(imread(im0)));
[n,m]=size(A);
[u,v]=horn_schunck(im0,im1,lambda,eps);
for x=1:n
    for y=1:m
        if (rem(x,6)==0)&(rem(y,6)==0)
            ua(x/6,y/6)=u(x,y);
            va(x/6,y/6)=v(x,y);
        end
    end
end
figure,quiver(ua,va);
axis tight ij;
