
% --- Destino de los archivos generados ---
if IsWin()
	pathDatos = '.\datos\';
	pathTemp = 'C:\temp\';
else
    %pathDatos = './datos/';
	pathDatos = '/tmp/'; 
	pathTemp = '/tmp/';
end

idSujeto=input('\nPor favor, ingrese su ID y presione Enter \n','s');

window = Screen(0, 'OpenWindow');
black = BlackIndex(window);



% ### INICIALIZAR CONSTANTES ###
RandStream.setDefaultStream(RandStream('mt19937ar','Seed',sum(100*clock)));
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

burbujas = ones(27,3,2)*16
aciertos = zeros(27,3,2);
apariciones = zeros(27,3,2);

est=1; %Id de estímulo

% --- Estructura de resultados ---
result.bloque	=0;
result.trial	=0;
result.m1	=zeros(256,256);
result.m2	=zeros(256,256);
result.m3	=zeros(256,256);
result.m4	=zeros(256,256);
result.m5	=zeros(256,256);
result.burbujas	=0;
result.aciertos	=0;
result.apariciones=0;
result.letra	='';
result.tipografia=0;
result.mayuscula='';
result.respuesta='';
result.tiempoRespuesta=0.0;
results		=result;


% ### CARGA DE IMÁGENES ###
mbienvenida = imread('./bienvenida.png');
mcruz = imread('./cruz.png');
mpresionetecla = imread('./presione_tecla.png');
mdespedida = imread('./despedida.png');
mintervalo = imread('./intervalo.png');

% ### COMIENZO DEL EXPERIMENTO ###

Screen('FillRect',window,black);
textura=Screen('MakeTexture', window, mbienvenida);
Screen('DrawTexture', window, textura);
Screen('Flip',window);
KbWait; % Presione cualquier tecla para continuar
Screen('Close', textura);

for b=1:cantBloques
	esMayuscula=round(rand());

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

		% RECIBIR RESPUESTA
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
		% GUARDAR los valores obtenidos (m�scaras, letra del est�mulo, letra predicha, tiempo transcurrido en responder)
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
		%GUARDAR en archivo general de resultados
		results(est)	= result;
	    
		if letraEstimulo == teclaNombre
			aciertos(letra, tipografia, mayuscula + 1)=aciertos(letra, tipografia, mayuscula + 1)+1;
		end
		if aciertos(letra, tipografia, mayuscula + 1)/apariciones(letra, tipografia, mayuscula + 1) < 0.52 % Si la el porcentaje de aciertos es menor a 52%, se agrega una burbuja para el pr�ximo
			burbujas(letra, tipografia, mayuscula + 1)=burbujas(letra, tipografia, mayuscula + 1)+1;
		end
		est=est+1;
	end
    
	if b < cantBloques
		textura=Screen('MakeTexture', window, mintervalo);
		Screen('DrawTexture', window, textura);
		Screen('Flip',window);
		KbPressWait();
		Screen('Close', textura);
	end
end

textura=Screen('MakeTexture', window, mdespedida);
Screen('DrawTexture', window, textura);    
Screen('Flip',window);
KbWait; % Presione cualquier tecla para continuar
Screen('Close', textura);


% ### GRABACIÓN DE RESULTADOS ###
nombreData=strcat(pathDatos, idSujeto,'_',date,'_',int2str(cputime*1000),'.mat');
save(nombreData, 'results');

Screen('CloseAll');