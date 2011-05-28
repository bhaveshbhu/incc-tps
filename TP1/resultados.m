%resultados.m
%
% genera los resultados para todas las letras
%addpath('/home/mmartinez/Documentos/incc/matlabPyrTools');
if ~(exist('planos','var'))
    load 'planos.mat'
end

if IsWin()
	letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'];
    separator = '\';
else
	letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'Ã±';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'];
    separator = '/';
end

for letra = 1:27
    for tipografia = 1:3
        for mayuscula = 1:2
            [p1,p2,p3,p4,p5] = calcularPlano(letra,tipografia,mayuscula,planos);
            if mayuscula==1
                mayStr = 'min';
            else
                mayStr = 'may';
            end
            nombreBase=[deblank(letras(letra,:)),'_',int2str(tipografia),'_',mayStr];
            nombreArchivo=[nombreBase,'_0.pgm'];
            [f1,f2,f3,f4,f5,f6] = generarFiltros(strcat('./estimulos/',nombreArchivo));
            [l,r1,r2,r3,r4,r5] = generarEstimulos(p1,p2,p3,p4,p5,f1,f2,f3,f4,f5);
            pgmWrite(l, ['./resultados',separator,nombreBase,'_0.pgm']);
            pgmWrite(r1, ['./resultados',separator,nombreBase,'_1.pgm']);
            pgmWrite(r2, ['./resultados',separator,nombreBase,'_2.pgm']);
            pgmWrite(r3, ['./resultados',separator,nombreBase,'_3.pgm']);
            pgmWrite(r4, ['./resultados',separator,nombreBase,'_4.pgm']);
            pgmWrite(r5, ['./resultados',separator,nombreBase,'_5.pgm']);
        end
    end
end