%subjNames es un array de structs con un único campo: name
function [datos, planos] = procesar(subjNames)

    if IsWin()
        letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'�';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']; %PONER �!!!
        separator = '\';
    else
        separator = '/';
        letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']; %PONER �!!!
    end

    plano.correctplane1 = zeros(256);
    plano.correctplane2 = zeros(256);
    plano.correctplane3 = zeros(256);
    plano.correctplane4 = zeros(256);
    plano.correctplane5 = zeros(256);
    plano.totalplane1 = zeros(256);
    plano.totalplane2 = zeros(256);
    plano.totalplane3 = zeros(256);
    plano.totalplane4 = zeros(256);
    plano.totalplane5 = zeros(256);
    
    estr.cantBurbujas = 0;
    estr.accuracy = 0;
    estr.tiemporespuesta = 0;
    estr.letra = [];
    estr.tipografia = [];
    estr.mayuscula = [];
    estr.vector = [];
    
    datos = repmat(estr,[length(letras), 3, 2]); %inicializo datos
    planos = repmat(plano,[length(letras), 3, 2]); %inicializo planos
    
%     for letra=1:length(letras)
%         for tipografia=1:3
%             for mayuscula=1:2
%                 datos(letra,tipografia,mayuscula) = estr; %inicializar estructuras vac�as
%             end
%         end
%     end
    
    for i = 1:length(subjNames) % procesar cada sujeto
        load(['datos', separator,subjNames(i).name]);
        sujeto = resumenResultados.sujeto;
        for bloque = 1:resumenResultados.cantBloques %procesar cada bloque del sujeto
            load(['datos', separator,generarNombreArchivo(sujeto,bloque)]);
            for e = 1:length(results) %procesar cada estímulo
                letra = find(letras==results(e).letra);
                tipografia = results(e).tipografia;
                if strcmp(results(e).mayuscula,'min')
                    mayuscula = 1;
                else
                    mayuscula = 2;
                end
                %agregar datos a la estructura
                %
                if (results(e).letra==results(e).respuesta) %si fue respuesta correcta agrego las m�scaras a correct plane
                    planos(letra,tipografia,mayuscula).correctplane1 = planos(letra,tipografia,mayuscula).correctplane1 + results(e).m1 ;
                    planos(letra,tipografia,mayuscula).correctplane2 = planos(letra,tipografia,mayuscula).correctplane2 + results(e).m2 ;
                    planos(letra,tipografia,mayuscula).correctplane3 = planos(letra,tipografia,mayuscula).correctplane3 + results(e).m3 ;
                    planos(letra,tipografia,mayuscula).correctplane4 = planos(letra,tipografia,mayuscula).correctplane4 + results(e).m4 ;
                    planos(letra,tipografia,mayuscula).correctplane5 = planos(letra,tipografia,mayuscula).correctplane5 + results(e).m5 ;
                    datos(letra,tipografia,mayuscula).accuracy = datos(letra,tipografia,mayuscula).accuracy + 1; %cuento un acierto
                end
                % agrego las m�scaras a totalplane
                planos(letra,tipografia,mayuscula).totalplane1 = planos(letra,tipografia,mayuscula).totalplane1 + results(e).m1;
                planos(letra,tipografia,mayuscula).totalplane2 = planos(letra,tipografia,mayuscula).totalplane2 + results(e).m2;
                planos(letra,tipografia,mayuscula).totalplane3 = planos(letra,tipografia,mayuscula).totalplane3 + results(e).m3;
                planos(letra,tipografia,mayuscula).totalplane4 = planos(letra,tipografia,mayuscula).totalplane4 + results(e).m4;
                planos(letra,tipografia,mayuscula).totalplane5 = planos(letra,tipografia,mayuscula).totalplane5 + results(e).m5;

                datos(letra,tipografia,mayuscula).tiemporespuesta = datos(letra,tipografia,mayuscula).tiemporespuesta + results(e).tiempoRespuesta;


                datos(letra,tipografia,mayuscula).letra = results(e).letra;
                datos(letra,tipografia,mayuscula).tipografia = results(e).tipografia;
                datos(letra,tipografia,mayuscula).mayuscula = results(e).mayuscula;

                %armo un paquetito para registrar el trial en le vector
                estrRespuesta.respuesta = results(e).respuesta;
                estrRespuesta.cantBurbujas = results(e).burbujas;
                estrRespuesta.tiemporespuesta = results(e).tiempoRespuesta;

                datos(letra,tipografia,mayuscula).vector = [datos(letra,tipografia,mayuscula).vector , estrRespuesta];
            end
        end
    end
    
    %recorrer toda la matriz para sumarizar datos o calcular promedios
    for letra=1:length(letras)
        for tipografia=1:3
            for mayuscula=1:2
                ntrials = length(datos(letra,tipografia,mayuscula).vector);
                if ntrials ~= 0
                    datos(letra,tipografia,mayuscula).tiemporespuesta = datos(letra,tipografia,mayuscula).tiemporespuesta / ntrials;
                    datos(letra,tipografia,mayuscula).accuracy = datos(letra,tipografia,mayuscula).accuracy / ntrials;
                    [blah, maxindex] = sort([datos(letra,tipografia,mayuscula).vector(:).cantBurbujas],'descend');
                    clear blah;
                    maxindex = maxindex(1);
                    datos(letra,tipografia,mayuscula).cantBurbujas = datos(letra,tipografia,mayuscula).vector(maxindex).cantBurbujas;
                end
            end
        end
    end
end