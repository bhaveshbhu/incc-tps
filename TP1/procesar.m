%subjNames es un array de structs con un único campo: name
function [datos, planos] = procesar(subjNames)

    if IsWin()
        letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'�';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']; %PONER �!!!
        separator = '\';
    else
        separator = '/';
        letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']; %PONER �!!!
    end
    imgletras = cell(27,1);

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
    estr.vector{length(subjNames)} = [];
    estr.names{length(subjNames)} = [];
    
    datos = repmat(estr,[length(letras), 3, 2]); %inicializo datos
    planos = repmat(plano,[length(letras), 3, 2]); %inicializo planos
    
    cantPos = zeros(length(letras), 3 ,2);
    cantTotal = zeros(length(letras), 3 ,2);
    
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
        vector = [];
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
                nombreArchivo=[deblank(letras(letra,:)),'_',int2str(tipografia),'_',results(e).mayuscula,'_0.pgm'];
                if length(imgletras{letra})==0
                    imgletras{letra} = pgmRead(['estimulos',separator,nombreArchivo]);
                end
                %agregar datos a la estructura
                %
                if (results(e).letra==results(e).respuesta) %si fue respuesta correcta agrego las m�scaras a correct plane
                    cantPos(letra,tipografia,mayuscula) = cantPos(letra,tipografia,mayuscula) + 1;
                    planos(letra,tipografia,mayuscula).correctplane1 = planos(letra,tipografia,mayuscula).correctplane1 + results(e).m1 ;
                    planos(letra,tipografia,mayuscula).correctplane2 = planos(letra,tipografia,mayuscula).correctplane2 + results(e).m2 ;
                    planos(letra,tipografia,mayuscula).correctplane3 = planos(letra,tipografia,mayuscula).correctplane3 + results(e).m3 ;
                    planos(letra,tipografia,mayuscula).correctplane4 = planos(letra,tipografia,mayuscula).correctplane4 + results(e).m4 ;
                    planos(letra,tipografia,mayuscula).correctplane5 = planos(letra,tipografia,mayuscula).correctplane5 + results(e).m5 ;
                    datos(letra,tipografia,mayuscula).accuracy = datos(letra,tipografia,mayuscula).accuracy + 1; %cuento un acierto
                end
                % agrego las m�scaras a totalplane
                cantTotal(letra,tipografia,mayuscula) = cantTotal(letra,tipografia,mayuscula) + 1;
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
                

                datos(letra,tipografia,mayuscula).vector(i) = {[datos(letra,tipografia,mayuscula).vector{i} , estrRespuesta]};
                datos(letra,tipografia,mayuscula).names(i) = {subjNames(i)};
            end
        end
    end
    
    %recorrer toda la matriz para sumarizar datos o calcular promedios
    for letra=1:length(letras)
        for tipografia=1:3
            for mayuscula=1:2
                ntrials = length([datos(letra,tipografia,mayuscula).vector{:}]);
                if ntrials ~= 0
                    datos(letra,tipografia,mayuscula).tiemporespuesta = datos(letra,tipografia,mayuscula).tiemporespuesta / ntrials;
                    datos(letra,tipografia,mayuscula).accuracy = datos(letra,tipografia,mayuscula).accuracy / ntrials;
                    maximos =[];
                    for i=1:length(datos(letra,tipografia,mayuscula).vector)
%                         vector = datos(letra,tipografia,mayuscula).vector{i};
%                         [blah, maxindex] = sort([vector(:).cantBurbujas],'descend');
%                         clear blah;
%                         maximos = [maximos, maxindex(1)];
                        vector = datos(letra,tipografia,mayuscula).vector{i};
                        if length(vector) == 0
                            cantidad = 0;
                        else
                            cantidad = [vector(:).cantBurbujas]; % el último contiene el valor máximo de burbujas para esta letra
                        end
                        maximos = [maximos, cantidad(length(cantidad))];
                    end
                    datos(letra,tipografia,mayuscula).cantBurbujas = mean(maximos);
                    clear maximos;
                    
                    %normalizo planos
                    if (cantPos(letra,tipografia,mayuscula) ~= 0)
                        planos(letra,tipografia,mayuscula).correctplane1 = planos(letra,tipografia,mayuscula).correctplane1 / cantPos(letra,tipografia,mayuscula);
                        planos(letra,tipografia,mayuscula).correctplane2 = planos(letra,tipografia,mayuscula).correctplane2 / cantPos(letra,tipografia,mayuscula);
                        planos(letra,tipografia,mayuscula).correctplane3 = planos(letra,tipografia,mayuscula).correctplane3 / cantPos(letra,tipografia,mayuscula);
                        planos(letra,tipografia,mayuscula).correctplane4 = planos(letra,tipografia,mayuscula).correctplane4 / cantPos(letra,tipografia,mayuscula);
                        planos(letra,tipografia,mayuscula).correctplane5 = planos(letra,tipografia,mayuscula).correctplane5 / cantPos(letra,tipografia,mayuscula);
                    end
                    if (cantTotal(letra,tipografia,mayuscula) ~= 0)
                        planos(letra,tipografia,mayuscula).totalplane1 = planos(letra,tipografia,mayuscula).totalplane1 / cantTotal(letra,tipografia,mayuscula);
                        planos(letra,tipografia,mayuscula).totalplane2 = planos(letra,tipografia,mayuscula).totalplane2 / cantTotal(letra,tipografia,mayuscula);
                        planos(letra,tipografia,mayuscula).totalplane3 = planos(letra,tipografia,mayuscula).totalplane3 / cantTotal(letra,tipografia,mayuscula);
                        planos(letra,tipografia,mayuscula).totalplane4 = planos(letra,tipografia,mayuscula).totalplane4 / cantTotal(letra,tipografia,mayuscula);
                        planos(letra,tipografia,mayuscula).totalplane5 = planos(letra,tipografia,mayuscula).totalplane5 / cantTotal(letra,tipografia,mayuscula);
                    end
                end
            end
        end
    end
end