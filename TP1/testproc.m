%testproc.m
%
% testea la R mayúscula arial
addpath('/home/mmartinez/Documentos/incc/matlabPyrTools');
if ~(exist('planos'))
    load 'planos.mat'
end
[p1,p2,p3,p4,p5] = calcularPlano(19,1,2,planos);
[i1,i2,i3,i4,i5,imtot] = calcularImagenes(p1,p2,p3,p4,p5,19,1,2);