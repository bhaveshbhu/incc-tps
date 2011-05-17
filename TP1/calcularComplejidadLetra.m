function complejidad = calcularComplejidadLetra( mletra )


    tamanio         = length(mletra(1,:));
    tamEstimulo     = length(mletra(1,:)) / 4;
    inicioEstimulo  = tamEstimulo * 1.5;
    finEstimulo     = inicioEstimulo + tamEstimulo;
    
    mletra    = (mletra < 255); % Se identifica los pixels con información
    mletraIzq = zeros(tamanio,tamanio);
    mletraDer = zeros(tamanio,tamanio);
    mletraArr = zeros(tamanio,tamanio);
    mletraAba = zeros(tamanio,tamanio);

    centroLetra = mletra(inicioEstimulo:finEstimulo + 1 ,inicioEstimulo:finEstimulo + 1 ); % Obtiene bloque efectivo de letra

    mletraIzq(inicioEstimulo  :finEstimulo+1 , inicioEstimulo-1:finEstimulo   ) = centroLetra;
    mletraDer(inicioEstimulo  :finEstimulo+1 , inicioEstimulo+1:finEstimulo+2 ) = centroLetra;
    mletraArr(inicioEstimulo-1:finEstimulo   , inicioEstimulo  :finEstimulo+1 ) = centroLetra;
    mletraAba(inicioEstimulo+1:finEstimulo+2 , inicioEstimulo  :finEstimulo+1 ) = centroLetra;
 
    letraBordes = xor(mletraIzq, mletra) |  xor(mletraDer, mletra) | xor(mletraArr, mletra) | xor(mletraAba, mletra);
    
    centroLetra = letraBordes(inicioEstimulo - 1:finEstimulo + 2 ,inicioEstimulo - 1:finEstimulo + 2 ); % Obtiene bloque efectivo de letra de los bordes

    mletraIzq = zeros(tamanio,tamanio);
    mletraDer = zeros(tamanio,tamanio);
    mletraArr = zeros(tamanio,tamanio);
    mletraAba = zeros(tamanio,tamanio);
    
    mletraIzq(inicioEstimulo-1:finEstimulo+2 , inicioEstimulo-2:finEstimulo+1 ) = centroLetra;
    mletraDer(inicioEstimulo-1:finEstimulo+2 , inicioEstimulo  :finEstimulo+3 ) = centroLetra;
    mletraArr(inicioEstimulo-2:finEstimulo+1 , inicioEstimulo-1:finEstimulo+2 ) = centroLetra;
    mletraAba(inicioEstimulo  :finEstimulo+3 , inicioEstimulo-1:finEstimulo+2 ) = centroLetra;
      
    letraBordes2 = mletraIzq |  mletraDer | mletraArr | mletraAba;
    
    perimetro = sum(sum(letraBordes2 > 0))/3;

    superficie = sum(sum(mletra));
    complejidad = (perimetro^2)/superficie;
       
end
