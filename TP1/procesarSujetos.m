if ~(IsWin())
    addpath('/home/mmartinez/Documentos/incc/matlabPyrTools');
end


sujetos = repmat([],2,1);

sujetos(1).name ='Diego_16-May-2011_413797_0.mat';
sujetos(2).name ='Heber_16-May-2011_994266_0.mat';
sujetos(3).name ='laura_18-May-2011_21563_0.mat';
sujetos(4).name ='nicolas_19-May-2011_14580_0.mat';

[datos, planos] = procesar(sujetos);

save('datos.mat', 'datos');
save('planos.mat', 'planos');