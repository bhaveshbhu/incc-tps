if ~(isWin())
    addpath('/home/mmartinez/Documentos/incc/matlabPyrTools');
end

numsujetos = 2;
sujetos = repmat([],2,1);

sujetos(1).name ='Diego_16-May-2011_413797_0.mat';
sujetos(2).name ='Heber_16-May-2011_994266_0.mat';

[datos, planos] = procesar(sujetos);

save('datos.mat', 'datos');
save('planos.mat', 'planos');