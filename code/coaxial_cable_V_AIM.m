h=0.01;      %  define step length

z=2/h;       %  key positions
w=z/4+1;
x=z/2+1;
y=0.75*z+1;

u=zeros(z+1,z+1);


u(1,:)=100;     %   boundary voltage
u(z+1,:)=100;
u(:,1)=100;
u(:,z+1)=100;

for n=1:42000       %   limit iterations to avoid inf loop
 o=0;                 
 for i=2:(w-1)
   for j=2:(x-1)
       
       a=u(i,j);
       b=u(i,j+1);
       c=u(i+1,j);
       d=u(i,j-1);
       e=u(i-1,j);
       f=0.25*(b+c+d+e);
       
       if abs(f-u(i,j))>0.000001           % judge u^{k+1} and u^{k} 
           u(i,j)=f;
           o=o+1;
       end

   end
 end

 if o==0                        % if precision reached, jump out of the loop
    break;
 end

%  mirroring 
u(2:(w-1),(x+1):z)=fliplr(u(2:(w-1),2:(x-1)));       

u(2:(w-1),x)=0.5*(u(2:(w-1),(x-1))+u(2:(w-1),(x+1)));

u((y+1):z,2:z)=flipud(u(2:(w-1),2:z));

u(w:y,2:(w-1))=fliplr(rot90(u(2:(w-1),w:y),-1));

u(w:y,(y+1):z)=rot90(u(2:(w-1),w:y),-1);

end


figure, surf(u), shading flat , colorbar;  %    visualizing
figure, imagesc(u), colorbar;
