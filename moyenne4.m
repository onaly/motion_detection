function [B]=moyenne4(A)
[n,m]=size(A);
B=zeros(n,m);
ligne_nulle=zeros(1,m+2);
colonne_nulle=zeros(n,1);
M=[colonne_nulle A colonne_nulle];
M=cat(1,ligne_nulle,M);
N=cat(1,M,ligne_nulle); %matrice à laquelle on ajoute 0 aux 4 bords
for k=1:n
    for l=1:m
        B(k,l)=0.25*(N(k,l+1)+N(k+2,l+1)+N(k+1,l)+N(k+1,l+2));
    end
end
