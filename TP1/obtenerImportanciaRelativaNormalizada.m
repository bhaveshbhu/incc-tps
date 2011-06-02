%## NORMALIZACIÓN MÁSCARAS RESULTADOS ## 

load('./impRelativaRasgos.mat')

impRelativaNormalizada=impRelativaRasgos;
impRelativaNormalizada(1,1,:)=impRelativaRasgos(1,1,:)*(1/sum([impRelativaRasgos(1,1,:)]));
impRelativaNormalizada(1,2,:)=impRelativaRasgos(1,2,:)*(1/sum([impRelativaRasgos(1,2,:)]));
impRelativaNormalizada(2,1,:)=impRelativaRasgos(2,1,:)*(1/sum([impRelativaRasgos(2,1,:)]));
impRelativaNormalizada(2,2,:)=impRelativaRasgos(2,2,:)*(1/sum([impRelativaRasgos(2,2,:)]));
impRelativaNormalizada(3,1,:)=impRelativaRasgos(3,1,:)*(1/sum([impRelativaRasgos(3,1,:)]));
impRelativaNormalizada(3,2,:)=impRelativaRasgos(3,2,:)*(1/sum([impRelativaRasgos(3,2,:)]));
impRelativaNormalizada(3,2,:)=impRelativaRasgos(3,2,:)*(1/sum([impRelativaRasgos(3,2,:)]));