N=100;      % Population size
M=3000;     % Maximum Iterations
D=3;        % Dimension of particle search space
w=0.729;    % Inertia weight
c1=2;       % Cognitive learning factor
c2=2;       % Social Learning Factors
popmax=[10 0.99 0.99];       % Maximum particle position
popmin=[ 0 0 0 ];            % Minimum particle position
vmax=[1e-1  1e-1 1e-1];            % Maximum particle velocity
vmin=[-1e-1 -1e-1 -1e-1];          % Minimum particle velocity
%Pop (i,:) i particle position, v (i, j) particle velocity, pi is the position of the individual optimal particle, fpi is the fitness value corresponding to the individual optimal particle
%Pg is the position of the global optimal particle and fpg is the fitness value corresponding to the global optimal particle
%Initialize Particle Swarm

for i=1:N
    for j=1:D
        pop(i,j)=popmax(j)*rand; 
        v(i,j)=vmax(j)*rand; 
    end
end

for i=1:N
    pi(i,:)=pop(i,:); 
    fpi(i)=fun1(pi(i,:)); 
end
pg=pi(1,:);

for i=2:N
    if fun1(pi(i,:)) < fun1(pg)
        pg=pi(i,:); 
        fpg=fun1(pg); 
    end
end

for t=1:M
    for i=1:N
        v(i,:)=w*v(i,:)+c1*rand*(pi(i,:)-pop(i,:))+c2*rand*(pg-pop(i,:)); 
        if v(i,:)>vmax
            v(i,:)=vmax;
        elseif v(i,:)<vmin
            v(i,:)=vmin;
        end
        
        pop(i,:)=pop(i,:)+v(i,:); 
       
        for s=1:D
            if pop(i,s)>popmax(s)
                pop(i,s)=popmax(s);
            elseif pop(i,s)<popmin(s)
                pop(i,s)=popmin(s);
            end
        end
        
        
        if fun1(pop(i,:))<fpi(i)
            fpi(i)=fun1(pop(i,:));
            pi(i,:)=pop(i,:);
        end
        
        if fpi(i)<fpg
            fpg=fpi(i);
            pg=pi(i,:);
        end
    end
    yy(t)=fpg;
    t
end

disp('***************************************')
disp(['The minimum value of the objective function is:',num2str(fpg)]);
disp(['When taking the minimum value, the value of the independent variable is:',num2str(pg)]);



%%
For multi parameter search, only change the corresponding search dimension, maximum/minimum position/speed.
