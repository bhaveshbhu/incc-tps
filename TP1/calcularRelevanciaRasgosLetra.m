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
    
    if totalPixels==0
        ir1         = 0;
        ir2         = 0;
        ir3         = 0;
        ir4         = 0;
        ir5         = 0;
        ir6         = 0;
        ir7         = 0;
        ir8         = 0;
        ir9         = 0;
        ir10        = 0;
        ir11        = 0;
    else
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
    end
    
    % Obtención de rasgos relevantes
    if sum(sum(rasgosLetra.mr1)) > 0
        rr1         = (sum(sum(mr1))/sum(sum(rasgosLetra.mr1)));
    else
        rr1 = 0;
    end

    if sum(sum(rasgosLetra.mr2)) > 0
        rr2         = (sum(sum(mr2))/sum(sum(rasgosLetra.mr2)));
    else
        rr2 = 0;
    end
    
    if sum(sum(rasgosLetra.mr3)) > 0
        rr3         = (sum(sum(mr3))/sum(sum(rasgosLetra.mr3)));
    else
        rr3 = 0;
    end

    if sum(sum(rasgosLetra.mr4)) > 0
        rr4         = (sum(sum(mr4))/sum(sum(rasgosLetra.mr4)));
    else
        rr4 = 0;
    end
    
    if sum(sum(rasgosLetra.mr5)) > 0
        rr5         = (sum(sum(mr5))/sum(sum(rasgosLetra.mr5)));
    else
        rr5 = 0;
    end

    if sum(sum(rasgosLetra.mr6)) > 0
        rr6         = (sum(sum(mr6))/sum(sum(rasgosLetra.mr6)));
    else
        rr6 = 0;
    end

    if sum(sum(rasgosLetra.mr7)) > 0
        rr7         = (sum(sum(mr7))/sum(sum(rasgosLetra.mr7)));
    else
        rr7 = 0;
    end
 
    if sum(sum(rasgosLetra.mr8)) > 0
        rr8         = (sum(sum(mr8))/sum(sum(rasgosLetra.mr8)));
    else
        rr8 = 0;
    end

    if sum(sum(rasgosLetra.mr9)) > 0
        rr9         = (sum(sum(mr9))/sum(sum(rasgosLetra.mr9)));
    else
        rr9 = 0;
    end

    if sum(sum(rasgosLetra.mr10)) > 0
        rr10         = (sum(sum(mr10))/sum(sum(rasgosLetra.mr10)));
    else
        rr10 = 0;
    end
    
    if sum(sum(rasgosLetra.mr11)) > 0
        rr11         = (sum(sum(mr11))/sum(sum(rasgosLetra.mr11)));
    else
        rr11 = 0;
    end
    
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
