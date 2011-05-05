function [f1,f2,f3,f4,f5,fondo] = generarFiltros(archivo)

oim = pgmRead(archivo);

tic; corrDn(oim,[1 1; 1 1]/4,'circular',[2 2]); time = toc;
imSubSample = min(max(floor(log2(time)/2+3),0),2);
im = blurDn(oim, imSubSample,'qmf9');

binom5 = binomialFilter(5);

lo_filt = 2*binom5*binom5';  %construct a separable 2D filter

blurred1 = corrDn(im,lo_filt,'circular',[2 2]);
fine1 = im - upConv(blurred1,lo_filt,'circular',[2 2],[1 1],size(im));

blurred2 = corrDn(blurred1,lo_filt,'circular',[2 2]);
fine2 = blurred1 - upConv(blurred2,lo_filt,'circular',[2 2],[1 1],size(blurred1));

blurred3 = corrDn(blurred2,lo_filt,'circular',[2 2]);
fine3 = blurred2 - upConv(blurred3,lo_filt,'circular',[2 2],[1 1],size(blurred2));

blurred4 = corrDn(blurred3,lo_filt,'circular',[2 2]);
fine4 = blurred3 - upConv(blurred4,lo_filt,'circular',[2 2],[1 1],size(blurred3));

blurred5 = corrDn(blurred4,lo_filt,'circular',[2 2]);
fine5 = blurred4 - upConv(blurred5,lo_filt,'circular',[2 2],[1 1],size(blurred4));

blurred6 = corrDn(blurred5,lo_filt,'circular',[2 2]);
%blurred7 = corrDn(blurred6,lo_filt,'circular',[2 2]);


fine2_full = upConv(fine2,lo_filt,'circular',[2 2],[1 1],size(im));
fine3_full = upConv(upConv(fine3,lo_filt,'circular',[2 2],[1 1],size(blurred1)),lo_filt,'circular',[2 2],[1 1],size(im));
fine4_full = upConv(upConv(upConv(fine4,lo_filt,'circular',[2 2],[1 1],size(blurred2)),lo_filt,'circular',[2 2],[1 1],size(blurred1)),lo_filt,'circular',[2 2],[1 1],size(im));
fine5_full = upConv(upConv(upConv(upConv(fine5,lo_filt,'circular',[2 2],[1 1],size(blurred3)),lo_filt,'circular',[2 2],[1 1],size(blurred2)),lo_filt,'circular',[2 2],[1 1],size(blurred1)),lo_filt,'circular',[2 2],[1 1],size(im));
blurred5_full = upConv(upConv(upConv(upConv(upConv(blurred5,lo_filt,'circular',[2 2],[1 1],size(blurred4)), lo_filt,'circular',[2 2],[1 1],size(blurred3)),lo_filt,'circular',[2 2],[1 1],size(blurred2)),lo_filt,'circular',[2 2],[1 1],size(blurred1)),lo_filt,'circular',[2 2],[1 1],size(im));

f1 = fine1 + blurred5_full;
f2 = fine2_full + blurred5_full;
f3 = fine3_full + blurred5_full;
f4 = fine4_full + blurred5_full;
f5 = fine5_full + blurred5_full;
fondo = blurred5_full;
end

endfunction