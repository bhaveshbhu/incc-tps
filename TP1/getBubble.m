function bubble = getBubble(diameter, variance)

	mu = [diameter/2 diameter/2];
	Sigma = [variance 0
		;0 variance];
	x1 = 0:1:diameter - 1; x2 = 0:1:diameter - 1;
	[X1,X2] = meshgrid(x1,x2);
	F = mvnpdf([X1(:) X2(:)],mu,Sigma);
	F = reshape(F,length(x2),length(x1));
	factor = 1 / F(diameter/2, diameter/2);
	bubble = F * factor;

	% surf(x1,x2,bubble);
	% caxis([min(bubble(:))-.5*range(bubble(:)),max(bubble(:))]);
	% %axis([-3 3 -3 3 0 .4])
	% xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
end