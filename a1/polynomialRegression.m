function w = polynomialRegression(K,x,y)
% Fill in this function.  It should return a (K+1)x1 weight vector w where the
% estimated model function is f(x) = \sum_{i=0}^{K} w(i) x^i.
for i =1:size(x)
    for j = 0:K
    	B(i, j+1) = x(i)^j;
	end
end
w = B \ y;
end