% ### CALCULO DE COMPLEJIDADES ####

if IsWin()
	letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'�';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'];
else
	letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'];
end

complejidades = ones(27,3,2)*0.11111;

for letra=1:27
    for tipo=1:3
        for may=1:2
          
            if may==2
                mayStr='may';
            else
                mayStr='min';
            end
            nombreArchivo=['estimulos/', deblank(letras(letra,:)),'_',int2str(tipo),'_',mayStr,'_0.pgm'];
            complejidades(letra,tipo,may)=calcularComplejidadLetra(imread(nombreArchivo));
        end
    end
end

save('complejidades','complejidades');
