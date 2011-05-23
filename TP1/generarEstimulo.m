function letra = generarEstimulo(m1,m2,m3,m4,m5,f1,f2,f3,f4,f5,f6, pathTemp)

    %nivel de luminancia del fondo 
    coef = 0.60;
    
    %calculo los "grises" de fondo en la escala de cada uno de los filtros
    g1 = (max(max(f1))-min(min(f1)))* coef + min(min(f1));
    g2 = (max(max(f2))-min(min(f2)))* coef + min(min(f2));
    g3 = (max(max(f3))-min(min(f3)))* coef + min(min(f3));
    g4 = (max(max(f4))-min(min(f4)))* coef + min(min(f4));
    g5 = (max(max(f5))-min(min(f5)))* coef + min(min(f5));

    %filtro las im�genes
    r1 = f1.*m1+(ones(256,256)*g1).*(1-m1);
    r2 = f2.*m2+(ones(256,256)*g2).*(1-m2);
    r3 = f3.*m3+(ones(256,256)*g3).*(1-m3);
    r4 = f4.*m4+(ones(256,256)*g4).*(1-m4);
    r5 = f5.*m5+(ones(256,256)*g5).*(1-m5);
    
    %compongo
	letra = r1+r2+r3+r4+r5;
    %grabo en un archivo para normalizar
    pgmWrite(letra,strcat(pathTemp,'letra.pgm'));   
end
