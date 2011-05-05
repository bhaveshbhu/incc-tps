window = Screen(0, 'OpenWindow');
mimagen = imread('./R_3_may_2.pgm');
textura=Screen('MakeTexture', window, mimagen);
Screen('DrawTexture', window, textura);
Screen('Flip',window);
WaitSecs(2);
Screen('CloseAll');