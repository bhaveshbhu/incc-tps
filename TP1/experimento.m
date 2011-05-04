window = Screen(0, 'OpenWindow');
letras=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','ñ','o','p','q','r','s','t','u','v','w','x','y','z'];
mayuscula=1;
minuscula=0;
maxBlocks=2;		% Se harán 100 bloques
estimPorBlock=10; 	% 270 estímulos random por bloque

mbienvenida = imread('./bienvenida.png');
mcruz = imread('./cruz.png');
mpresionetecla = imread('./presione_tecla.png');



aciertos=0;
e=1;

textura=Screen('MakeTexture', window, mbienvenida);
Screen('DrawTexture', window, textura);
Screen('Flip',window);
KbWait; %Presione cualquier tecla para continuar
Screen('Close', textura);
for b=1:maxBlocks
	esMayuscula=round(rand());
	burbujas=10;
	while mod(e,estimPorBlock) ~=0
	    textura=Screen('MakeTexture', window, mcruz);
	    Screen('DrawTexture', window, textura);
	    Screen('Flip',window);
	    WaitSecs(0.5);
	    Screen('Close', textura);
	    letra=rand()*26+1; 		%Devuelve un id de letra con una letra entre a-z ([1..27])
	    letra=1;
	    tipografia=rand()*3+1;	%Devuelve el id de una tipografía de las utilizadas ([1..4])
	    mascaras=generarMascaras(burbujas);	%Devuelve un vector de 5 máscaras con la cantidad de burbujas especificada, y de acuerdo a las bandas predefinidas
	    if mod(e,estimPorBlock)>(estimPorBlock/2)
		mayuscula=esMayuscula;
		%mletra=mletra_a_may;
	    else
		mayuscula=mod(esMayuscula + 1,2);
		%mletra=mletra_a_min;
	    end
	    mletra = generarEstimulo(letra, tipografia, mayuscula, mascaras); %Devuelve una matriz con la imagen generada de la letra en may/min para la tipografia especificada, utilizando las máscaras indicadas
	    textura=Screen('MakeTexture', window, mletra);
	    Screen('DrawTexture', window, textura);    
	    Screen('Flip',window);	    
	    WaitSecs(0.2);
	    Screen('Close', textura);
	    textura=Screen('MakeTexture', window, mpresionetecla);
	    Screen('DrawTexture', window, textura);    
	    Screen('Flip',window);
	    Screen('Close', textura);
	    %KbWait;
        % RECIBIR RESPUESTA
	    [secs,tecla,deltasecs] = KbPressWait();
	    teclaNombre = KbName(tecla)
	    letras(letra)
	    e=e+1;
        % GUARDAR los valores obtenidos (máscaras, letra del estímulo, letra predicha, tiempo transcurrido en responder)
	    if letras(letra) == teclaNombre
		aciertos=aciertos+1
	    end
	    if aciertos/e < 0.52 % Si la el porcentaje de aciertos es menor a 52%, se agrega una burbuja para el próximo
		burbujas=burbujas+1
	    end
	end
	e=e+1;	
end

Screen('CloseAll');