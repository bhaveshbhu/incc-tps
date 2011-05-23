% if ~(IsWin())
%     addpath('/home/mmartinez/Documentos/incc/matlabPyrTools');
% end

sujetos = repmat([],9,1);

%sujetos = repmat([],2,1);
% 
 sujetos(1).name ='Diego_16-May-2011_413797_0.mat';
 sujetos(2).name ='Heber_16-May-2011_994266_0.mat';
 sujetos(3).name ='laura_18-May-2011_21563_0.mat';
 sujetos(4).name ='Marina_21-May-2011_450094_0.mat';
 sujetos(5).name ='patriciop_21-May-2011_19750_0.mat';
 sujetos(6).name ='nicolas_19-May-2011_14580_0.mat';
 sujetos(7).name ='Mailen_19-May-2011_40490_0.mat';
 sujetos(8).name ='Christian_23-May-2011_27172_0.mat';
 sujetos(9).name ='miguel_23-May-2011_13688_0.mat';

%sujetos(1).name = 'ideal_22-May-2011_364328_0.mat';

[datos, planos] = procesar(sujetos);

save('datos.mat', 'datos');
save('planos.mat', 'planos');
% save('datos_ideal.mat', 'datos');
% save('planos_ideal.mat', 'planos');
