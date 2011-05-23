clear; 

if IsWin()
    letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'�';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']; %PONER �!!!
    separator = '\';
else
    separator = '/';
    letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']; %PONER �!!!
end

mayStr = ['min'; 'may']
noise = zeros(length(letras),3,2);

%cargo todas las letras para tenerlas en memoria e ir comparando
imgletras = cell(27,3,2);
for letra=1:length(letras)
    for tipografia=1:3
        for mayusculas=1:2
            nombreArchivo=[deblank(letras(letra,:)),'_',int2str(tipografia),'_',mayStr(mayusculas,:),'_0.pgm'];
            imgletras{letra,tipografia,mayusculas} = pgmRead(['estimulos',separator,nombreArchivo]);
        end
    end
end


idSujeto = 'ideal';
idSujeto = strcat(idSujeto, '_', date, '_', int2str(cputime*1000));

% ### INICIALIZAR CONSTANTES ###

% --- Destino de los archivos generados ---
if IsWin()
	pathDatos = '.\datos\';
	pathTemp = 'C:\temp\';
else
    %pathDatos = './datos/';
	pathDatos = '/tmp/';
	pathTemp = '/tmp/';
end

if ~(IsOctave())
	RandStream.setDefaultStream(RandStream('mt19937ar','Seed',sum(100*clock)));
end

mayuscula=1;
minuscula=0;

% --- Parámetros de Ejecución ---
cantBloques	= 25;		% Cantidad de bloques del experimento
estimPorBlock	= 100; 	% Cantidad de estímulos por bloque

% ### INICIALIZAR VARIABLES ###


% Se define la cantidad de burbujas de acuerdo a la cantidades promedio utilizada por los sujetos
% burbujas 	= ones(27,3,2)*10;
% burbujas(:,1,:) = 4;
% burbujas(:,3,:) = 4;
load('burbujasPromedio.mat');
burbujas=floor(burbujas);
aciertos	= zeros(27,3,2);
apariciones = zeros(27,3,2);

resumenResultados.sujeto        = idSujeto;
resumenResultados.cantBloques   = cantBloques;
resumenResultados.estimPorBlock = estimPorBlock;
resumenResultados.fechaHora     = datestr(now);
resumenResultados.isWin         = IsWin();
resumenResultados.isOctave      = IsOctave();

% ### GRABACION DE LISTADO DE ARCHIVOS ###
nombreData      = strcat(pathDatos, generarNombreArchivo(idSujeto,0));
save(nombreData, 'resumenResultados');

est=1; %Id de estímulo

% --- Estructura de resultados ---
result.bloque	= 0;
result.trial	= 0;
result.m1		= zeros(256,256);
result.m2		= zeros(256,256);
result.m3		= zeros(256,256);
result.m4		= zeros(256,256);
result.m5		= zeros(256,256);
result.burbujas	= 0;
result.aciertos	= 0;
result.apariciones	= 0;
result.letra	= '';
result.tipografia	= 0;
result.mayuscula	= '';
result.respuesta	= '';
result.tiempoRespuesta= 0.0000;
results			= result;

% ### CARGA DE IM�?GENES ###
mbienvenida 	= imread('./bienvenida.png');
mcruz 		= imread('./cruz.png');
mpresionetecla 	= imread('./presione_tecla.png');
mdespedida 	= imread('./despedida.png');
mintervalo 	= imread('./intervalo.png');

% ### COMIENZO DEL EXPERIMENTO ###

% --- Mensaje de Bienvenida ---
% textura=Screen('MakeTexture', window, mbienvenida);
% Screen('DrawTexture', window, textura);
% Screen('Flip',window);
% KbWait; % Presione cualquier tecla para continuar
% Screen('Close', textura);
       
for bloq=1:cantBloques
	esMayuscula = round(rand());
	for e=1:estimPorBlock
% 		textura=Screen('MakeTexture', window, mcruz);
% 		Screen('DrawTexture', window, textura);
% 		Screen('Flip',window);
% 		WaitSecs(0.5);
% 		Screen('Close', textura);
		letra       = ceil(rand()*27); 		%Devuelve un id de letra con una letra entre a-z ([1..27])
		tipografia  = ceil(rand()*3);	%Devuelve el id de una tipograf�a de las utilizadas ([1..4])
		
		if mod(est,estimPorBlock)>(estimPorBlock/2)
			mayuscula=esMayuscula;
		else
			mayuscula=mod(esMayuscula + 1,2);
		end

		if mayuscula==1
			mayStr='may';
		else
			mayStr='min';
		end
		apariciones(letra, tipografia, mayuscula + 1) = apariciones(letra, tipografia, mayuscula + 1) + 1;
		[m1,m2,m3,m4,m5]=generarMascaras(burbujas(letra, tipografia, mayuscula + 1));	%Devuelve un vector de 5 m�scaras con la cantidad de burbujas especificada, y de acuerdo a las bandas predefinidas
		nombreArchivo=[deblank(letras(letra,:)),'_',int2str(tipografia),'_',mayStr,'_0.pgm'];
		[f1,f2,f3,f4,f5,f6] = generarFiltros(strcat('./estimulos/',nombreArchivo), 0);
        f1 = saveandload(saveandload(f1) + rand(256)*noise(letra,tipografia,mayuscula+1)*256);
        f2 = saveandload(saveandload(f2) + rand(256)*noise(letra,tipografia,mayuscula+1)*256);
        f3 = saveandload(saveandload(f3) + rand(256)*noise(letra,tipografia,mayuscula+1)*256);
        f4 = saveandload(saveandload(f4) + rand(256)*noise(letra,tipografia,mayuscula+1)*256);
        f5 = saveandload(saveandload(f5) + rand(256)*noise(letra,tipografia,mayuscula+1)*256);
		mletra1  = saveandload(generarEstimulo(m1,m2,m3,m4,m5,f1,f2,f3,f4,f5,f6, pathTemp)); %Devuelve una matriz con la imagen generada de la letra en may/min para la tipografia especificada, utilizando las m�scaras indicadas
	    %mletra1 = saveandload(saveandload(mletra1) + rand(256)*noise(letra,tipografia,mayuscula+1)*256);
% 		mletra  = imread(strcat(pathTemp,'letra.pgm'));
% 		textura = Screen('MakeTexture', window, mletra);
% 		Screen('DrawTexture', window, textura);    
% 		Screen('Flip',window);	    
% 		WaitSecs(0.2);
% 		Screen('Close', textura);
% 		textura=Screen('MakeTexture', window, mpresionetecla);
% 		Screen('DrawTexture', window, textura);    
% 		Screen('Flip',window);
% 		Screen('Close', textura);

		% ### RECIBIR RESPUESTA ###
        hipotesis = -1;
        minnorm=-1;
		for hletra = 1:length(letras)
            for htipografia = 1:3
                for hmayusculas = 1:2
                    %norma = norm(mletra1-imgletras{hletra,htipografia,hmayusculas});
                    %norma = mean(mean((double(mletra1) - double(imgletras{hletra,htipografia,hmayusculas})).^2,2),1);
                    imtemp = imgletras{hletra,htipografia,hmayusculas};
                    norma = -corr(mletra1(:),imtemp(:));
                    if minnorm == -1 || norma < minnorm
                        minnorm = norma;
                        hipotesis = hletra;
                    end
                end
            end
        end
        teclaNombre = letras(hipotesis);
        %mostrar soluci�n del observador ideal letra_hletra
        display([letras(letra), '_', teclaNombre]);
        imshow(saveandload(mletra1)/255);
        
		letraEstimulo=deblank(letras(letra,:));
		% ### GUARDAR VALORES OBTENIDOS ### (máscaras, letra del estímulo, letra predicha, tiempo transcurrido en responder)
		result.bloque	= bloq;
		result.trial	= est;
		result.m1	= m1;
		result.m2	= m2;
		result.m3	= m3;
		result.m4	= m4;
        result.m5	= m5;
        result.burbujas	= burbujas(letra, tipografia, mayuscula + 1);
		result.aciertos	= aciertos(letra, tipografia, mayuscula + 1);
		result.apariciones= apariciones(letra, tipografia, mayuscula + 1);
        result.letra	= letraEstimulo;
        result.tipografia=tipografia;
		result.mayuscula= mayStr;
		result.respuesta= teclaNombre;
		result.tiempoRespuesta= 0;
		% --- Guardar en archivo general de resultados ---
		results(e)	= result;
	    
		if letraEstimulo == teclaNombre
			aciertos(letra, tipografia, mayuscula + 1)=aciertos(letra, tipografia, mayuscula + 1)+1;
		end
% 		if aciertos(letra, tipografia, mayuscula + 1)/apariciones(letra, tipografia, mayuscula + 1) < 0.52 % Si la el porcentaje de aciertos es menor a 52%, se agrega una burbuja para el pr�ximo
% 			burbujas(letra, tipografia, mayuscula + 1)=burbujas(letra, tipografia, mayuscula + 1)+1;
%         end
        if aciertos(letra, tipografia, mayuscula + 1)/apariciones(letra, tipografia, mayuscula + 1) > 0.52 % Si el porcentaje de aciertos es mayor a 52%, se agrega ruido para el pr�ximo
			noise(letra,tipografia,mayuscula + 1) = noise(letra,tipografia,mayuscula + 1) + 0.2;
        end
        %mostrar el accuracy actual
        
        disp(aciertos(letra, tipografia, mayuscula + 1)/apariciones(letra, tipografia, mayuscula + 1));
        if aciertos(letra, tipografia, mayuscula + 1)/apariciones(letra, tipografia, mayuscula + 1) == 0 && tipografia == 2
            disp('paro');
        end
        if aciertos(letra, tipografia, mayuscula + 1)/apariciones(letra, tipografia, mayuscula + 1) ~= 0 && tipografia == 2
            disp('paro');
        end
		est=est+1;
    end

    % ### GRABACIÓN DE RESULTADOS ###
	nombreData      = strcat(pathDatos, generarNombreArchivo(idSujeto,bloq));
    display(nombreData);
	save(nombreData, 'results');
    
    
	% ### DESCANSO ENTRE BLOQUES ###
% 	if bloq < cantBloques
% 		textura=Screen('MakeTexture', window, mintervalo);
% 		Screen('DrawTexture', window, textura);
% 		Screen('Flip',window);
% 		KbPressWait();
% 		Screen('Close', textura);
% 	end

end


% --- Mensaje de Despedida ---
% textura=Screen('MakeTexture', window, mdespedida);
% Screen('DrawTexture', window, textura);
% Screen('Flip',window);
% KbWait; % Presione cualquier tecla para continuar
% Screen('Close', textura);
% 
% Screen('CloseAll');