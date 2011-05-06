function letra = generarEstimulo(m1,m2,m3,m4,m5,f1,f2,f3,f4,f5,f6)

    fondo = mean(mean(f6)) * ones(256);
	r1=(f1.*m1);% + f6;
	r2=(f2.*m2);% + f6;
	r3=(f3.*m3);% + f6;
	r4=(f4.*m4);% + f6;
	r5=(f5.*m5);% + f6;
        
	letra = r1+r2+r3+r4+r5+1000;
    pgmWrite(letra,'/tmp/letra.pgm');
end