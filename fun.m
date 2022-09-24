function sum = fun1(z0)

y0 = [8e6 16 0];  %% Respectively representing the number of susceptible persons, infected persons and cured persons
c=z0(1);
gamma=z0(2);
m=z0(3);
sum=0;

aaa=[...]; 
[t,x]=ode45(@(t,x) SIR1(t,x,c,gamma,m),[0:50],y0);
    for i=1:50
        sum=(Y(n,2)+Y(n,3)-aaa(i))^2+sum;
    end

end

%%   The aaa part is the actual infection data, which can be obtained from the following website:
%%   https://www.chp.gov.hk/en/media/116/index.html?page=1
%%   https://github.com/CSSEGISandData/COVID-19
