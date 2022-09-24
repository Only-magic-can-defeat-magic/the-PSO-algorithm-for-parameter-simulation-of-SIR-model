function y=SIR(t,x,c,gamma,m)
N=8e6;
beta=m+0.005*randn();
if(beta<0)
    beta=0;
end
if(beta>1)
    beta=1;
end 

y=[-c*beta*x(2)*x(1)/N,...
c*beta*x(2)*x(1)/N-gamma*x(2),...
gamma*x(2)]';
end


%%Only a general sir model is given, and the noise intensity is set as 0.05. Later, you can modify the y=[...] part according to the infection model you need to change.
%%It can also be the value of the infection coefficient beta of the constructor type.
