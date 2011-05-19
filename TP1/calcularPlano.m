% letra de la 1-27
% tipografia (1-arial, 2-kunstler, 3-famosas)
% mayúscula (1-minúscula 2-mayúscula)
function [p1, p2, p3, p4, p5] = calcularPlano(letra, tipografia, mayuscula, planos)
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
    
    %plano = (correctplane1 + correctplane2 + correctplane3 + correctplane4 + correctplane5) ./  (totalplane1 + totalplane2 + totalplane3 + totalplane4 + totalplane5);
    p1 = correctplane1 ./ totalplane1;
    p2 = correctplane2 ./ totalplane2;
    p3 = correctplane2 ./ totalplane3;
    p4 = correctplane2 ./ totalplane4;
    p5 = correctplane2 ./ totalplane5;
    
    p1(isnan(p1)) = 0;
    p2(isnan(p2)) = 0;
    p3(isnan(p3)) = 0;
    p4(isnan(p4)) = 0;
    p5(isnan(p5)) = 0;
end