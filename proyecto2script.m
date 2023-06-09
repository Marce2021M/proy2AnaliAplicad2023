% FUNCIÓN EG2
%parámetros modificados en dfp: 
%parámetros modificados en BFGS: 

fname = 'EG2';
x = ones(100,1);

% Método de descenso de Newton

[xfN,MGN, jN] = desnewton(fname, x);

gN = gradiente(fname,xfN);
ngN= norm(gN);

% Método BFGS

[xfB,MGB, jB ] = bfgs(fname, x);

gB = gradiente(fname,xfB);
ngB = norm(gB);


% Método DFP

[xfD,MGD,jD] = dfp(fname, x);

gD = gradiente(fname,xfD);
ngD = norm(gD);

% Método fminunc

%[xfFM,fxf] = fminunc(extendedPenalty,x)

%% FUNCIÓN EXTENDED PENALTY

%parámetros modificados en dfp: 
%parámetros modificados en BFGS: 

fname = 'extendedPenalty';
x = (1:1000)';

% Método de descenso de Newton

[xfN,MGN, jN] = desnewton(fname, x);

gN = gradiente(fname,xfN);
ngN= norm(gN);

% Método BFGS

[xfB,MGB, jB ] = bfgs(fname, x);

gB = gradiente(fname,xfB);
ngB = norm(gB);


% Método DFP

[xfD,MGD,jD] = dfp(fname, x);

gD = gradiente(fname,xfD);
ngD = norm(gD);

% Método fminunc

%[xfFM,fxf,exitflag,output,grad,hessian] = fminunc(fname,x)


%% GRÁFICA DFP

semilogy([1:length(MGD)], MGD, 'rd', [1:length(MGD)], MGD, 'b', 'Linewidth', 3)
title('Convergencia de DFP', 'Fontsize',20)
xlabel('Número de iteraciones', 'Fontsize',20);
ylabel('||g||', 'Fontsize',20);  
%% GRÁFICA BFGS
semilogy([1:length(MGB)], MGB, 'rd', [1:length(MGB)], MGB, 'b', 'Linewidth', 3)
title('Convergencia de BFGS', 'Fontsize',20)
xlabel('Número de iteraciones', 'Fontsize',20);
ylabel('||g||', 'Fontsize',20);
%% GRÁFICA NEWTON
semilogy([1:length(MGN)], MGN, 'rd', [1:length(MGN)], MGN, 'b', 'Linewidth', 3)
title('Convergencia de NEWTON', 'Fontsize',20)
xlabel('Número de iteraciones', 'Fontsize',20);
ylabel('||g||', 'Fontsize',20);
%%

sz = [4 4];
varTypes = ["string","int16","double", "double"];
varNames = ["Método","Núm. iter", "||∇f(x*)||2","cputime"];
T = table('Size',sz,'VariableTypes',varTypes,'VariableNames',varNames);

T(1,varNames) = {"Método de Newton",jN,ngN,.5};
T(2,varNames) ={"Método BFGS", jB,ngB,.5 };
T(3,varNames) ={"Método DFP", jD,ngD,.5 }


%falta poner fminunc


