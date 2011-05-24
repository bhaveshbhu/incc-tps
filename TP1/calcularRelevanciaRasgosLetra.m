function relevanciaRasgos = calcularRelevanciaRasgosLetra(mascara,rasgosLetra)
    %UMBRAL      = 0.10;
    vectorizado = sort(mascara(:));
    UMBRAL = vectorizado(62259);
    
    INC_MIN     = 0.75; % Inclusión mínima para ser considerado un rasgo relevante
        
    mtotal      = mascara > UMBRAL;
    
    % Píxeles que se muestran por cada rasgo
    mr1         = (mascara .* rasgosLetra.mr1) > UMBRAL;
    mr2         = (mascara .* rasgosLetra.mr2) > UMBRAL;
    mr3         = (mascara .* rasgosLetra.mr3) > UMBRAL;
    mr4         = (mascara .* rasgosLetra.mr4) > UMBRAL;
    mr5         = (mascara .* rasgosLetra.mr5) > UMBRAL;
    mr6         = (mascara .* rasgosLetra.mr6) > UMBRAL;
    mr7         = (mascara .* rasgosLetra.mr7) > UMBRAL;
    mr8         = (mascara .* rasgosLetra.mr8) > UMBRAL;
    mr9         = (mascara .* rasgosLetra.mr9) > UMBRAL;
    mr10        = (mascara .* rasgosLetra.mr10) > UMBRAL;
    mr11        = (mascara .* rasgosLetra.mr11) > UMBRAL;
    
    totalPixels = sum(sum(mr1+mr2+mr3+mr4+mr5+mr6+mr7+mr8+mr9+mr10+mr11));
    
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
    rr1         = (sum(sum(mr1))/sum(sum(rasgosLetra.mr1))) > INC_MIN;
    rr2         = (sum(sum(mr2))/sum(sum(rasgosLetra.mr2))) > INC_MIN;
    rr3         = (sum(sum(mr3))/sum(sum(rasgosLetra.mr3))) > INC_MIN;
    rr4         = (sum(sum(mr4))/sum(sum(rasgosLetra.mr4))) > INC_MIN;
    rr5         = (sum(sum(mr5))/sum(sum(rasgosLetra.mr5))) > INC_MIN;
    rr6         = (sum(sum(mr6))/sum(sum(rasgosLetra.mr6))) > INC_MIN;
    rr7         = (sum(sum(mr7))/sum(sum(rasgosLetra.mr7))) > INC_MIN;
    rr8         = (sum(sum(mr8))/sum(sum(rasgosLetra.mr8))) > INC_MIN;
    rr9         = (sum(sum(mr9))/sum(sum(rasgosLetra.mr9))) > INC_MIN;
    rr10        = (sum(sum(mr10))/sum(sum(rasgosLetra.mr10))) > INC_MIN;
    rr11        = (sum(sum(mr11))/sum(sum(rasgosLetra.mr11))) > INC_MIN;
    
    % Generación de resultados (Rasgos relevante o no, importancia relativa)
    relevanciaRasgos.r1  = struct('relevante',rr1,'importancia',ir1);
    relevanciaRasgos.r2  = struct('relevante',rr2,'importancia',ir2);
    relevanciaRasgos.r3  = struct('relevante',rr3,'importancia',ir3);
    relevanciaRasgos.r4  = struct('relevante',rr4,'importancia',ir4);
    relevanciaRasgos.r5  = struct('relevante',rr5,'importancia',ir5);
    relevanciaRasgos.r6  = struct('relevante',rr6,'importancia',ir6);
    relevanciaRasgos.r7  = struct('relevante',rr7,'importancia',ir7);
    relevanciaRasgos.r8  = struct('relevante',rr8,'importancia',ir8);
    relevanciaRasgos.r9  = struct('relevante',rr9,'importancia',ir9);
    relevanciaRasgos.r10 = struct('relevante',rr10,'importancia',ir10);
    relevanciaRasgos.r11 = struct('relevante',rr11,'importancia',ir11);
      

end
