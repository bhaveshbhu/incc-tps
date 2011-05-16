
% --- Destino de los archivos generados ---
if IsWin()
	pathDatos = '.\datos\';
	pathTemp = 'C:\temp\';
else
    %pathDatos = './datos/';
	pathDatos = '/tmp/'; 
	pathTemp = '/tmp/';
end

% ### ENTRADA DE ID DE SUJETO ###
idSujeto = input('\nPor favor, ingrese su ID y presione Enter \n','s');
idSujeto = strcat(idSujeto, '_', date, '_', int2str(cputime*1000));

% ### INICIALIZAR CONSTANTES ###
if ~ (IsOctave())
	RandStream.setDefaultStream(RandStream('mt19937ar','Seed',sum(100*clock)));
end

mayuscula=1;
minuscula=0;

% --- Parámetros de Ejecución ---
cantBloques	= 5;		% Cantidad de bloques del experimento
estimPorBlock	= 100; 	% Cantidad de estímulos por bloque

%letras=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','�','o', %'p','q','r','s','t','u','v','w','x','y','z'];
if IsWin()
	letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'�';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'];
else
	letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z'];
end


% ### INICIALIZAR VARIABLES ###
window = Screen('OpenWindow', 0);
black = BlackIndex(window);
burbujas 	= ones(27,3,2)*16
aciertos	= zeros(27,3,2);
apariciones 	= zeros(27,3,2);

est=1; %Id de estímulo

% --- Estructura de resultados ---
resultVacio.bloque	= 0;
resultVacio.trial		= 0;
resultVacio.m1		= zeros(256,256);
resultVacio.m2		= zeros(256,256);
resultVacio.m3		= zeros(256,256);
resultVacio.m4		= zeros(256,256);
resultVacio.m5		= zeros(256,256);
resultVacio.burbujas	= 0;
resultVacio.aciertos	= 0;
resultVacio.apariciones	= 0;
resultVacio.letra	= '';
resultVacio.tipografia	= 0;
resultVacio.mayuscula	= '';
resultVacio.respuesta	= '';
resultVacio.tiempoRespuesta= 0.0;
results			= resultVacio;

% ### CARGA DE IMÁGENES ###
mbienvenida 	= imread('./bienvenida.png');
mcruz 		= imread('./cruz.png');
mpresionetecla 	= imread('./presione_tecla.png');
mdespedida 	= imread('./despedida.png');
mintervalo 	= imread('./intervalo.png');

% ### COMIENZO DEL EXPERIMENTO ###

%Screen('FillRect',window,black);
% --- Mensaje de Bienvenida ---
textura=Screen('MakeTexture', window, mbienvenida);
Screen('DrawTexture', window, textura);
Screen('Flip',window);
KbWait; % Presione cualquier tecla para continuar
Screen('Close', textura);

for bloq=1:cantBloques
	esMayuscula = round(rand());
	for e=1:estimPorBlock
		textura=Screen('MakeTexture', window, mcruz);
		Screen('DrawTexture', window, textura);
		Screen('Flip',window);
		WaitSecs(0.5);
		Screen('Close', textura);
		letra=round(rand()*26+1); 		%Devuelve un id de letra con una letra entre a-z ([1..27])
		tipografia=round(rand()*2+1);	%Devuelve el id de una tipograf�a de las utilizadas ([1..4])
		
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
		[f1,f2,f3,f4,f5,f6] = generarFiltros(strcat('./estimulos/',nombreArchivo));
		mletra1  = generarEstimulo(m1,m2,m3,m4,m5,f1,f2,f3,f4,f5,f6, pathTemp); %Devuelve una matriz con la imagen generada de la letra en may/min para la tipografia especificada, utilizando las m�scaras indicadas
	    
		mletra  = imread(strcat(pathTemp,'letra.pgm'));
		textura = Screen('MakeTexture', window, mletra);
		Screen('DrawTexture', window, textura);    
		Screen('Flip',window);	    
		WaitSecs(0.2);
		Screen('Close', textura);
		textura=Screen('MakeTexture', window, mpresionetecla);
		Screen('DrawTexture', window, textura);    
		Screen('Flip',window);
		Screen('Close', textura);

		% ### RECIBIR RESPUESTA ###
		teclaNombre='0';
		while  ((teclaNombre < 'a') || (teclaNombre > 'z')) && teclaNombre~=letras(15,:) %letra �
			tic;
			[secs,tecla,deltasecs] = KbPressWait();
			deltasecs=toc;
			teclaNombre = KbName(tecla);
			if strcmp(teclaNombre,'ntilde') || ( IsWin() && strcmp(teclaNombre,'`') )
				teclaNombre=letras(15,:); %letra �
			else
				if length(teclaNombre)>1
					teclaNombre='0';
				end
			end
		end	    

		letraEstimulo=deblank(letras(letra,:));
		% ### GUARDAR VALORES OBTENIDOS ### (máscaras, letra del estímulo, letra predicha, tiempo transcurrido en responder)
		result.bloque	= b;
		result.trial	= est;
		result.m1	= m1;
		result.m2	= m2;
		result.m3	= m3;
		result.m4	= m4;
		result.m5	= m5;
		result.tipografia=tipografia;
		result.mayuscula= mayStr;
		result.letra	= letraEstimulo;
		result.burbujas	= burbujas(letra, tipografia, mayuscula + 1);
		result.aciertos	= aciertos(letra, tipografia, mayuscula + 1);
		result.apariciones= apariciones(letra, tipografia, mayuscula + 1);
		result.respuesta= teclaNombre;
		result.tiempoRespuesta= deltasecs;
		% --- Guardar en archivo general de resultados ---
		results(e)	= result;
	    
		if letraEstimulo == teclaNombre
			aciertos(letra, tipografia, mayuscula + 1)=aciertos(letra, tipografia, mayuscula + 1)+1;
		end
		if aciertos(letra, tipografia, mayuscula + 1)/apariciones(letra, tipografia, mayuscula + 1) < 0.52 % Si la el porcentaje de aciertos es menor a 52%, se agrega una burbuja para el pr�ximo
			burbujas(letra, tipografia, mayuscula + 1)=burbujas(letra, tipografia, mayuscula + 1)+1;
		end
		est=est+1;
	end

	% ### DESCANSO ENTRE BLOQUES ###
	if bloq < cantBloques
		textura=Screen('MakeTexture', window, mintervalo);
		Screen('DrawTexture', window, textura);
		Screen('Flip',window);
		KbPressWait();
		Screen('Close', textura);
	end

	% ### GRABACIÓN DE RESULTADOS ###
	nombreData=strcat(pathDatos, idSujeto, '_' , bloq, '.mat');
	save(nombreData, 'results');
end

% --- Mensaje de Despedida ---
textura=Screen('MakeTexture', window, mdespedida);
Screen('DrawTexture', window, textura);
Screen('Flip',window);
KbWait; % Presione cualquier tecla para continuar
Screen('Close', textura);

Screen('CloseAll');