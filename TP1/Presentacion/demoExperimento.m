
% ## DEMO EXPERIMENTO PRESENTACIÓN 31/5/2011 ##

% Carga de lista de imágenes

estimulos(1)=imread('./estimulosDemo/f_3_min_0.png');
estimulos(2)=imread('./estimulosDemo/r_2_may_0.png');

window = Screen('OpenWindow', 0,0);

textura=Screen('MakeTexture', window, mbienvenida);
Screen('DrawTexture', window, textura);
Screen('Flip',window);
KbWait; % Presione cualquier tecla para continuar
Screen('Close', textura);

for est=1:length(estimulos)
	textura=Screen('MakeTexture', window, mcruz);
	Screen('DrawTexture', window, textura);
	Screen('Flip',window);
	WaitSecs(0.5);
	Screen('Close', textura);

	% # Se muestra el estímulo
	mletra  = estimulos(est);
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
	% En caso de haberse registrado más de una tecla, se toma la primera de ellas
		if  (length(teclaNombre)==6 && strcmp(teclaNombre,'ntilde')) || ( IsWin() && length(teclaNombre)==1 && strcmp(teclaNombre,'`'))
			teclaNombre=letras(15,:); %letra �
		else
			if length(teclaNombre)>1
				teclaNombre='0';
			end
		end
	end	    

end


% --- Mensaje de Despedida ---
textura=Screen('MakeTexture', window, mdespedida);
Screen('DrawTexture', window, textura);
Screen('Flip',window);
KbWait; % Presione cualquier tecla para continuar
Screen('Close', textura);

Screen('CloseAll');