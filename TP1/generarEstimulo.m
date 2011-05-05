function letra = generarEstimulo(mascaras, filtros)

	m1,m2,m3,m4,m5=zeros(256,256);
	f1,f2,f3,f4,f5,f6=zeros(256,256);

	m1=mascaras(1:256,1256);
	m2=mascaras(1:256,257:512);
	m3=mascaras(1:256,513:768);
	m4=mascaras(1:256,769:1024);
	m5=mascaras(1:256,1025:1280);

	f1=filtros(1:256,1256);
	f2=filtros(1:256,257:512);
	f3=filtros(1:256,513:768);
	f4=filtros(1:256,769:1024);
	f5=filtros(1:256,1025:1280);
	f6=filtros(1:256,1281:1536);

	r1=f1.*m1+f6;
	r2=f2.*m2+f6;
	r3=f3.*m3+f6;
	r4=f4.*m4+f6;
	r5=f5.*m5+f6;

	letra = r1+r2+r3+r4+r5
endfunction