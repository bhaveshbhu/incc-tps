function nombre = generarNombreArchivo(sujeto,nroBloque)
    nombre = strcat(sujeto, '_' , int2str(nroBloque), '.mat');
end