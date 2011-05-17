% letra de la 1-27
% tipografia (1-arial, 2-kunstler, 3-famosas)
% mayúscula (1-minúscula 2-mayúscula)
function [im1,im2,im3,im4,im5,imtot] = calcularImagenes(p1,p2,p3,p4,p5,letra,tipografia,mayuscula)
    fondo = 255;
    coef=0.60;
    if IsWin()
        letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'�';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'];
        pathTemp = 'C:\temp\';
    else
        letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'];
        pathTemp = '/tmp/';
    end
    if mayuscula==1
        mayStr = 'min';
    else
        mayStr = 'may';
    end
    nombreArchivo=[deblank(letras(letra,:)),'_',int2str(tipografia),'_',mayStr,'_0.pgm'];
    [f1,f2,f3,f4,f5,f6] = generarFiltros(strcat('./estimulos/',nombreArchivo));
    
    %calculo los "grises" de fondo en la escala de cada uno de los filtros
    g1 = (max(max(f1))-min(min(f1)))* coef + min(min(f1));
    g2 = (max(max(f2))-min(min(f2)))* coef + min(min(f2));
    g3 = (max(max(f3))-min(min(f3)))* coef + min(min(f3));
    g4 = (max(max(f4))-min(min(f4)))* coef + min(min(f4));
    g5 = (max(max(f5))-min(min(f5)))* coef + min(min(f5));
    
    %filtro las im�genes
    im1 = f1.*p1+(ones(256,256)*g1).*(1-p1);
    im2 = f2.*p2+(ones(256,256)*g2).*(1-p2);
    im3 = f3.*p3+(ones(256,256)*g3).*(1-p3);
    im4 = f4.*p4+(ones(256,256)*g4).*(1-p4);
    im5 = f5.*p5+(ones(256,256)*g5).*(1-p5);
    
    ptot = (p1+p2+p3+p4+p5)/5;
    gtot = (max(max(f1+f2+f3+f4+f5))-min(min(f1+f2+f3+f4+f5)))* coef + min(min(f1+f2+f3+f4+f5));
    imtot = (f1+f2+f3+f4+f5)*ptot +(ones(256,256)*gtot).*(1-ptot); ;
    
    pgmWrite(imtot,strcat(pathTemp,'letra.pgm'));   
    imtot = pgmRead(strcat(pathTemp,'letra.pgm'));
    imshow(f1);
end