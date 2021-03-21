function [u,v]=horn_schunck(im0, im1, lambda, eps)
A=double(rgb2gray(imread(im0))); %permet d'obtenir la luminance
B=double(rgb2gray(imread(im1)));
grad_t=B-A; %gradient temporel

Icopy_x=[A(:,2:end) A(:,end)]; %matrice avec coeff décalés vers la gauche
Icopy_y=cat(1,A(2:end,:),A(end,:)); % matrice avec coeff décalés vers le haut

grad_x=Icopy_x-A; %permet de calculer I(k,j+1)-I(k,j)

grad_y=Icopy_y-A; %permet de calculer I(k+1,j)-I(k,j)

facteur=lambda./(1+lambda.*(grad_x.^2+grad_y.^2));

u0=zeros(size(A));
v0=zeros(size(A));
u1=-grad_x.*(grad_t).*facteur; %car u0 est nul
v1=-grad_y.*(grad_t).*facteur; %car v0 est nul

while norm(u1-u0)>eps && (norm(v1-v0)>eps) %tant que la norme > eps
    u0=u1;
    v0=v1;
    um=moyenne4(u0);
    vm=moyenne4(v0);
    u1=um-grad_x.*(grad_x.*um+grad_y.*vm+grad_t).*facteur;
    v1=vm-grad_y.*(grad_x.*um+grad_y.*vm+grad_t).*facteur;
end
u=u1;
v=v1;
end
    








