window = Screen(0, 'OpenWindow');
mayuscula=1;
miniscula=0;
maxBlocks=2;		% Se harán 100 bloques
estimPorBlock=10; 	% 270 estímulos random por bloque

mcruz = imread('./cruz.png');
mpresionetecla = imread('./presione_tecla.png');

mletra_a_may = imread('./a_may.png');	% A BORRAR
mletra_a_min = imread('./a_min.png');	% A BORRAR

aciertos=0;
e=1;
for b=1:maxBlocks
	burbujas=10;
	textura=Screen('MakeTexture', window, mcruz);
	Screen('DrawTexture', window, textura);
	Screen('Flip',window);
	KbWait; %Presione cualquier tecla para continuar
	Screen('Close', textura);
	while mod(e,estimPorBlock)!=0
	    if mod(e,estimPorBlock)>(estimPorBlock/2)
		% idLetra=letraRandom(); 			%Devuelve un id de letra con una letra entre a-z ([1..27])
		% tipografia=tipografiaRandom(); 	%Devuelve el id de una tipografía de las utilizadas ([1..4])
		% mascaras=generarMascaras(burbujas);	%Devuelve un vector de 5 máscaras con la cantidad de burbujas especificada, y de acuerdo a las bandas predefinidas
		% mletra = generarEstimulo(letra, tipografia, mayuscula, mascaras); %Devuelve una matriz con la imagen generada de la letra en may/min para la tipografia especificada, utilizando las máscaras indicadas
		mletra=mletra_a_may;
	    else
		%mletra=obtenerLetra(mayuscula, burbujas); % ARMAR DUMMY devolviendo un conjunto cerrado de imágenes
		mletra=mletra_a_min;
	    end
	    textura=Screen('MakeTexture', window, mletra);
	    Screen('DrawTexture', window, textura);    
	    Screen('Flip',window);
	    WaitSecs(1);
	    Screen('Close', textura);
	    % RECIBIR RESPUESTA
	    [secs,tecla,deltasecs] = KbPressWait();
	    teclaNombre = KbName(tecla);
	    if letras(idLetra)== teclaNombre
		aciertos++;
	    end
	    if aciertos/e < 0.52 % Si la el porcentaje de aciertos es menor a 52%, se agrega una burbuja para el próximo
		burbujas++;
	    end

	    textura=Screen('MakeTexture', window, mpresionetecla);
	    Screen('DrawTexture', window, textura);    
	    Screen('Flip',window);
	    Screen('Close', textura);
	    KbWait;
	    e++;
	end
	e++;
end

Screen('CloseAll');