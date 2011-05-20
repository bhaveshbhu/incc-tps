function relevanciaRasgos = calcularRelevanciaRasgosLetra(mascara,rasgosLetra)
    UMBRAL      = 0.10;
    INC_MIN     = 0.75; % Inclusión mínima para ser considerado un rasgo relevante
        
    mtotal      = mascara > UMBRAL;
    totalPixels = sum(sum(mtotal));

    % Píxeles que se muestran por cada rasgo
    mr1         = (mascara .* rasgosLetra.r1) > UMBRAL;
    mr2         = (mascara .* rasgosLetra.r2) > UMBRAL;
    mr3         = (mascara .* rasgosLetra.r3) > UMBRAL;
    mr4         = (mascara .* rasgosLetra.r4) > UMBRAL;
    mr5         = (mascara .* rasgosLetra.r5) > UMBRAL;
    mr6         = (mascara .* rasgosLetra.r6) > UMBRAL;
    mr7         = (mascara .* rasgosLetra.r7) > UMBRAL;
    mr8         = (mascara .* rasgosLetra.r8) > UMBRAL;
    mr9         = (mascara .* rasgosLetra.r9) > UMBRAL;
    mr10        = (mascara .* rasgosLetra.r10) > UMBRAL;
    mr11        = (mascara .* rasgosLetra.r11) > UMBRAL;

    % Importancia Relativa de cada rasgo
    ir1         = sum(sum(mr1))/totalPixels;
    ir2         = sum(sum(mr2))/totalPixels;
    ir3         = sum(sum(mr3))/totalPixels;
    ir4         = sum(sum(mr4))/totalPixels;
    ir5         = sum(sum(mr5))/totalPixels;
    ir6         = sum(sum(mr6))/totalPixels;
    ir7         = sum(sum(mr7))/totalPixels;
    ir8         = sum(sum(mr8))/totalPixels;
    ir9         = sum(sum(mr9))/totalPixels;
    ir10        = sum(sum(mr10))/totalPixels;
    ir11        = sum(sum(mr11))/totalPixels;
    
    % Obtención de rasgos relevantes
    rr1         = (sum(sum(mr1))/sum(sum(rasgosLetra.r1))) > INC_MIN;
    rr2         = (sum(sum(mr2))/sum(sum(rasgosLetra.r2))) > INC_MIN;
    rr3         = (sum(sum(mr3))/sum(sum(rasgosLetra.r3))) > INC_MIN;
    rr4         = (sum(sum(mr4))/sum(sum(rasgosLetra.r4))) > INC_MIN;
    rr5         = (sum(sum(mr5))/sum(sum(rasgosLetra.r5))) > INC_MIN;
    rr6         = (sum(sum(mr6))/sum(sum(rasgosLetra.r6))) > INC_MIN;
    rr7         = (sum(sum(mr7))/sum(sum(rasgosLetra.r7))) > INC_MIN;
    rr8         = (sum(sum(mr8))/sum(sum(rasgosLetra.r8))) > INC_MIN;
    rr9         = (sum(sum(mr9))/sum(sum(rasgosLetra.r9))) > INC_MIN;
    rr10        = (sum(sum(r10))/sum(sum(rasgosLetra.r10))) > INC_MIN;
    rr11        = (sum(sum(r11))/sum(sum(rasgosLetra.r11))) > INC_MIN;
    
    % Generación de resultados (Rasgos relevante o no, importancia relativa)
    relevanciaRasgos    = struct('relevante',rr1,'importancia',ir1);
    relevanciaRasgos(2) = struct('relevante',rr2,'importancia',ir2);
    relevanciaRasgos(3) = struct('relevante',rr3,'importancia',ir3);
    relevanciaRasgos(4) = struct('relevante',rr4,'importancia',ir4);
    relevanciaRasgos(5) = struct('relevante',rr5,'importancia',ir5);
    relevanciaRasgos(6) = struct('relevante',rr6,'importancia',ir6);
    relevanciaRasgos(7) = struct('relevante',rr7,'importancia',ir7);
    relevanciaRasgos(8) = struct('relevante',rr8,'importancia',ir8);
    relevanciaRasgos(9) = struct('relevante',rr9,'importancia',ir9);
    relevanciaRasgos(10) = struct('relevante',rr10,'importancia',ir10);
    relevanciaRasgos(11) = struct('relevante',rr11,'importancia',ir11);
      

end
