[EX,EY]=gradient(u);            %  E=-\nabla V    
EX=-EX;
EY=-EY;
figure, quiver(EX,EY);

epsilon=8.8542e-12;

Q=4*epsilon*(sum(EY(x:y,y)*h) + sum(EX(y,x:y)*h) + sum(EY(y:(z+1),x)*h)  + sum(EX((z+1),x:(z+1))*h) + sum(EY(x:(z+1),(z+1))*h) + sum(EX(x,y:(z+1))*h)  );

C=Q/100;
C