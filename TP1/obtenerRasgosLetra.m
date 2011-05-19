
function [mr1,mr2,mr3,mr4,mr5,mr6,mr7,mr8,mr9,mr10,mr11] = obtenerRasgosLetra(mrasgos)
% r1  =[128 128 128];
% r2  =[255 0 0];
% r3  =[255 128 0];
% r4  =[255 255 0];
% r5  =[0 255 0];
% r6  =[0 255 255];
% r7  =[0 0 255];
% r8  =[255 0 255];
% r9  =[255 128 128];
% r10 =[0 128 0];
% r11 =[128 0 128];

    mr1  = (mrasgos(:,:,1)==128)    & (mrasgos(:,:,2)==128) & (mrasgos(:,:,3)==128);
    mr2  = (mrasgos(:,:,1)==255)    & (mrasgos(:,:,2)==  0) & (mrasgos(:,:,3)==  0);
    mr3  = (mrasgos(:,:,1)==255)    & (mrasgos(:,:,2)==128) & (mrasgos(:,:,3)==  0);
    mr4  = (mrasgos(:,:,1)==255)    & (mrasgos(:,:,2)==255) & (mrasgos(:,:,3)==  0);
    mr5  = (mrasgos(:,:,1)==  0)    & (mrasgos(:,:,2)==255) & (mrasgos(:,:,3)==  0);
    mr6  = (mrasgos(:,:,1)==  0)    & (mrasgos(:,:,2)==255) & (mrasgos(:,:,3)==255);
    mr7  = (mrasgos(:,:,1)==  0)    & (mrasgos(:,:,2)==  0) & (mrasgos(:,:,3)==255);
    mr8  = (mrasgos(:,:,1)==255)    & (mrasgos(:,:,2)==  0) & (mrasgos(:,:,3)==255);
    mr9  = (mrasgos(:,:,1)==255)    & (mrasgos(:,:,2)==128) & (mrasgos(:,:,3)==128);
    mr10 = (mrasgos(:,:,1)==  0)    & (mrasgos(:,:,2)==128) & (mrasgos(:,:,3)==  0);
    mr11 = (mrasgos(:,:,1)==128)    & (mrasgos(:,:,2)==  0) & (mrasgos(:,:,3)==128);

end