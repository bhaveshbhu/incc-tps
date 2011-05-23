%testproc.m
%
% testea la R mayúscula arial
%addpath('/home/mmartinez/Documentos/incc/matlabPyrTools');
if ~(exist('planos'))
    load 'planos.mat'
end

if IsWin()
	letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'�';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'];
else
	letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'];
end


letra = 20;
tipografia = 1;
mayuscula = 2;

[p1,p2,p3,p4,p5] = calcularPlano(letra,tipografia,mayuscula,planos);
[i1,i2,i3,i4,i5,imtot] = calcularImagenes(p1,p2,p3,p4,p5,letra,tipografia,mayuscula);

imshow(imtot);