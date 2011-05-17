% letra de la a-z
% tipografia (1-arial, 2-kunstler, 3-famosas)
% mayúscula (1-minúscula 2-mayúscula)
function plano = calcularPlano(letra, tipografia, mayuscula, planos)
    correctplane1 = planos(letra,tipografia,mayuscula).correctplane1;
    correctplane2 = planos(letra,tipografia,mayuscula).correctplane2;
    correctplane3 = planos(letra,tipografia,mayuscula).correctplane3;
    correctplane4 = planos(letra,tipografia,mayuscula).correctplane4;
    correctplane5 = planos(letra,tipografia,mayuscula).correctplane5;
    
    totalplane1 = planos(letra,tipografia,mayuscula).totalplane1;
    totalplane2 = planos(letra,tipografia,mayuscula).totalplane2;
    totalplane3 = planos(letra,tipografia,mayuscula).totalplane3;
    totalplane4 = planos(letra,tipografia,mayuscula).totalplane4;
    totalplane5 = planos(letra,tipografia,mayuscula).totalplane5;
    
    plano = (correctplane1 + correctplane2 + correctplane3 + correctplane4 + correctplane5) ./  (totalplane1 + totalplane2 + totalplane3 + totalplane4 + totalplane5);
end