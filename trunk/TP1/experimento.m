%TODO: Registrar cantidad de burbujas por letra-estímulo en 
% una matriz de 27x3x2
burbujas = ones(27,3,2)*10;
aciertos = zeros(27,3,2);
apariciones = zeros(27,3,2);
black = BlackIndex(window);

RandStream.setDefaultStream(RandStream('mt19937ar','Seed',sum(100*clock)));

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
%letras=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','�','o',
%'p','q','r','s','t','u','v','w','x','y','z'];
if IsWin()
    letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'�';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']; %PONER �!!!
else
    letras=['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'ñ';'o';'p';'q';'r';'s';'t';'u';'v';'w';'x';'y';'z']; %PONER �!!!
end


%INICIALIZAR VARIABLES
result.bloque=0;
result.trial=0;
result.m1=zeros(256,256);
result.m2=zeros(256,256);
result.m3=zeros(256,256);
result.m4=zeros(256,256);
result.m5=zeros(256,256);
%result.f1=zeros(256,256);
%result.f2=zeros(256,256);
%result.f3=zeros(256,256);
%result.f4=zeros(256,256);
%result.f5=zeros(256,256);
result.burbujas=0;
result.aciertos=0;
result.apariciones=0;
result.letra='';
result.tipografia=0;
result.mayuscula='';
%result.estimulo=zeros(256,256);
result.respuesta='';
result.tiempoRespuesta=0.0;

results=result;

mayuscula=1;
minuscula=0;
cantBloques=5;		% Se har�n 100 bloques
estimPorBlock=100; 	% 270 est�mulos random por bloque

%Imágenes útiles
mbienvenida = imread('./bienvenida.png');
mcruz = imread('./cruz.png');
mpresionetecla = imread('./presione_tecla.png');
mdespedida = imread('./despedida.png');
mintervalo = imread('./intervalo.png');

Screen('FillRect',window,black);
textura=Screen('MakeTexture', window, mbienvenida);
Screen('DrawTexture', window, textura);
Screen('Flip',window);
KbWait; % Presione cualquier tecla para continuar
Screen('Close', textura);

est=1;
for b=1:cantBloques
	esMayuscula=round(rand());
	%burbujas=16;

	%while mod(est,estimPorBlock) ~=0
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
	    %KbWait;
        % RECIBIR RESPUESTAint2str(cputime*1000)
	    teclaNombre='0';
	    while  ((teclaNombre < 'a') || (teclaNombre > 'z')) && teclaNombre~=letras(15,:) %letra �
	      [secs,tecla,deltasecs] = KbPressWait();
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
	    result.bloque=b;
	    result.trial=est;
	    result.m1=m1;
	    result.m2=m2;
	    result.m3=m3;
	    result.m4=m4;
	    result.m5=m5;
	    %result.f1=f1;
	    %result.f2=f2;
	    %result.f3=f3;
	    %result.f4=f4;
	    %result.f5=f5;
        result.tipografia=tipografia;
        result.mayuscula=mayStr;
	    result.letra=letraEstimulo;
	    result.burbujas=burbujas(letra, tipografia, mayuscula + 1);
        result.aciertos=aciertos(letra, tipografia, mayuscula + 1);
        result.apariciones=apariciones(letra, tipografia, mayuscula + 1);
        %result.estimulo=mletra;
	    result.respuesta=teclaNombre;
	    result.tiempoRespuesta=deltasecs;
	    %GUARDAR en archivo general de resultados
	    results(est)=result;
	    
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


nombreData=strcat(pathDatos, idSujeto,'_',date,'_',int2str(cputime*1000),'.mat');
save(nombreData, 'results');

Screen('CloseAll');