%window = Screen(0, 'OpenWindow');
[secs,tecla,deltasecs] = KbPressWait();
teclaNombre = KbName(tecla);
"Presionó la tecla:",teclaNombre

Screen('CloseAll');