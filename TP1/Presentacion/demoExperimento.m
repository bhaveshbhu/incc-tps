
% ## DEMO EXPERIMENTO PRESENTACIÓN 31/5/2011 ##

% Carga de lista de imágenes
% ### CARGA DE IM�?GENES ###
mbienvenida 	= imread('../bienvenida.png');
mcruz           = imread('../cruz.png');
mpresionetecla 	= imread('../presione_tecla.png');
mdespedida      = imread('../despedida.png');
mintervalo      = imread('../intervalo.png');

estimulos = {};
estimulos{1}=imread('./estimulosDemo/f_3_min_0.png');
estimulos{2}=imread('./estimulosDemo/r_2_may_0.png');
estimulos{3}=imread('./estimulosDemo/r1.png');
estimulos{4}=imread('./estimulosDemo/h1.png');
estimulos{5}=imread('./estimulosDemo/g1.png');
estimulos{6}=imread('./estimulosDemo/r2.png');
estimulos{7}=imread('./estimulosDemo/h2.png');
estimulos{8}=imread('./estimulosDemo/g2.png');
estimulos{9}=imread('./estimulosDemo/r3.png');
estimulos{10}=imread('./estimulosDemo/h3.png');
estimulos{11}=imread('./estimulosDemo/g3.png');

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
	mletra  = estimulos{est};
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
    KbPressWait();
end


% --- Mensaje de Despedida ---
textura=Screen('MakeTexture', window, mdespedida);
Screen('DrawTexture', window, textura);
Screen('Flip',window);
KbPressWait(); % Presione cualquier tecla para continuar
Screen('Close', textura);

Screen('CloseAll');