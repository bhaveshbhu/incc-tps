function mascarasResultado = obtenerMascarasResultado(mPlanos)

  mascarasResultado = struct('mascaraResultante',ones(256,256) * 0.0001, 'mascara1',ones(256,256) * 0.0001, 'mascara2', ones(256,256) * 0.0001, 'mascara3', ones(256,256) * 0.0001, 'mascara4', ones(256,256) * 0.0001, 'mascara5', ones(256,256) * 0.0001);

  for letra=1:27
	  for tipo=1:3
		  for may=1:2
			  [m1 m2 m3 m4 m5] = calcularPlano(letra,tipo,may,mPlanos);
			  mascarasResultado(letra,tipo,may) = struct('mascaraResultante',max(cat(3,m1,m2,m3,m4,m5),[],3), 'mascara1',m1, 'mascara2', m2, 'mascara3', m3, 'mascara4', m4, 'mascara5', m5);			  
		  end
	  end
  end


end