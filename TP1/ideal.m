if IsWin()
    letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'�';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']; %PONER �!!!
    separator = '\';
else
    separator = '/';
    letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']; %PONER �!!!
end
mayStr = ['min', 'may']

imgletras = cell(27,3,2);

for letra=1:length(letras)
    for tipografia=1:3
        for mayusculas=1:2
            nombreArchivo=[deblank(letras(letra,:)),'_',int2str(tipografia),'_',mayStr(mayusculas),'_0.pgm'];
            pgmRead(nombreArchivo);
        end
    end
end
