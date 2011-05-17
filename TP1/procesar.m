function resultado = procesar(results)
    if IsWin()
        letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']; %PONER ï¿½!!!
    else
        letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'Ã±';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']; %PONER ï¿½!!!
    end

%     estr.correctplane1 = zeros(256);
%     estr.correctplane2 = zeros(256);
%     estr.correctplane3 = zeros(256);
%     estr.correctplane4 = zeros(256);
%     estr.correctplane5 = zeros(256);
%     estr.totalplane1 = zeros(256);
%     estr.totalplane2 = zeros(256);
%     estr.totalplane3 = zeros(256);
%     estr.totalplane4 = zeros(256);
%     estr.totalplane5 = zeros(256);
    estr.cantBurbujas = 0;
    estr.accuracy = 0;
    estr.tiemporespuesta = 0;
    estr.letra = [];
    estr.tipografia = [];
    estr.mayuscula = [];
    estr.vector = [];
    
    resultado = repmat(estr,[length(letras), 3, 2]); %inicializo resultado
    
%     for letra=1:length(letras)
%         for tipografia=1:3
%             for mayuscula=1:2
%                 resultado(letra,tipografia,mayuscula) = estr; %inicializar estructuras vacías
%             end
%         end
%     end
    
    for e = 1:length(results) %incluir la información de cada estímulo
        letra = find(letras==results(e).letra);
        tipografia = results(e).tipografia;
        if results(e).mayuscula=='min'
            mayuscula = 1;
        else
            mayuscula = 2;
        end
        %agregar datos a la estructura
        %
        if (results(e).letra==results(e).respuesta) %si fue respuesta correcta agrego las máscaras a correct plane
%             resultado(letra,tipografia,mayuscula).correctplane1 = resultado(letra,tipografia,mayuscula).correctplane1 + results(e).m1 ;
%             resultado(letra,tipografia,mayuscula).correctplane2 = resultado(letra,tipografia,mayuscula).correctplane2 + results(e).m2 ;
%             resultado(letra,tipografia,mayuscula).correctplane3 = resultado(letra,tipografia,mayuscula).correctplane3 + results(e).m3 ;
%             resultado(letra,tipografia,mayuscula).correctplane4 = resultado(letra,tipografia,mayuscula).correctplane4 + results(e).m4 ;
%             resultado(letra,tipografia,mayuscula).correctplane5 = resultado(letra,tipografia,mayuscula).correctplane5 + results(e).m5 ;
            resultado(letra,tipografia,mayuscula).accuracy = resultado(letra,tipografia,mayuscula).accuracy + 1; %cuento un acierto
        end
        % agrego las máscaras a totalplane
%         resultado(letra,tipografia,mayuscula).totalplane1 = resultado(letra,tipografia,mayuscula).totalplane1 + results(e).m1;
%         resultado(letra,tipografia,mayuscula).totalplane2 = resultado(letra,tipografia,mayuscula).totalplane2 + results(e).m2;
%         resultado(letra,tipografia,mayuscula).totalplane3 = resultado(letra,tipografia,mayuscula).totalplane3 + results(e).m3;
%         resultado(letra,tipografia,mayuscula).totalplane4 = resultado(letra,tipografia,mayuscula).totalplane4 + results(e).m4;
%         resultado(letra,tipografia,mayuscula).totalplane5 = resultado(letra,tipografia,mayuscula).totalplane5 + results(e).m5;
        
        resultado(letra,tipografia,mayuscula).tiemporespuesta = resultado(letra,tipografia,mayuscula).tiemporespuesta + results(e).tiempoRespuesta;
        
        
        resultado(letra,tipografia,mayuscula).letra = results(e).letra;
        resultado(letra,tipografia,mayuscula).tipografia = results(e).tipografia;
        resultado(letra,tipografia,mayuscula).mayuscula = results(e).mayuscula;
        
        %armo un paquetito para registrar el trial en le vector
        estrRespuesta.respuesta = results(e).respuesta;
        estrRespuesta.cantBurbujas = results(e).burbujas;
        estrRespuesta.tiemporespuesta = results(e).tiempoRespuesta;
        
        resultado(letra,tipografia,mayuscula).vector = [resultado(letra,tipografia,mayuscula).vector , estrRespuesta];
    end
    
    %recorrer toda la matriz para sumarizar datos o calcular promedios
    for letra=1:length(letras)
        for tipografia=1:3
            for mayuscula=1:2
                ntrials = length(resultado(letra,tipografia,mayuscula).vector);
                if ntrials ~= 0
                    resultado(letra,tipografia,mayuscula).tiemporespuesta = resultado(letra,tipografia,mayuscula).tiemporespuesta / ntrials;
                    resultado(letra,tipografia,mayuscula).accuracy = resultado(letra,tipografia,mayuscula).accuracy / ntrials;
                    [blah, maxindex] = sort([resultado(letra,tipografia,mayuscula).vector(:).cantBurbujas],'descend');
                    clear blah;
                    maxindex = maxindex(1);
                    resultado(letra,tipografia,mayuscula).cantBurbujas = resultado(letra,tipografia,mayuscula).vector(maxindex).cantBurbujas;
                end
            end
        end
    end
end