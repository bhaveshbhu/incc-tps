if ~(exist('rasgosLetras','var'))
    load('relevanciaRasgos.mat');
end
r1 = cell(11);
for i=1:3
    temp = [rasgosLetras(:,i,:).r1];
    r1{i} = [temp.importancia];
    temp = [rasgosLetras(:,i,:).r2];
    r2{i} = [temp.importancia];
    temp = [rasgosLetras(:,i,:).r3];
    r3{i} = [temp.importancia];
    temp = [rasgosLetras(:,i,:).r4];
    r4{i} = [temp.importancia];
    temp = [rasgosLetras(:,i,:).r5];
    r5{i} = [temp.importancia];
    temp = [rasgosLetras(:,i,:).r6];
    r6{i} = [temp.importancia];
    temp = [rasgosLetras(:,i,:).r7];
    r7{i} = [temp.importancia];
    temp = [rasgosLetras(:,i,:).r8];
    r8{i} = [temp.importancia];
    temp = [rasgosLetras(:,i,:).r9];
    r9{i} = [temp.importancia];
    temp = [rasgosLetras(:,i,:).r10];
    r10{i} = [temp.importancia];
    temp = [rasgosLetras(:,i,:).r11];
    r11{i} = [temp.importancia];
end

