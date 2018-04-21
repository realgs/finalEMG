%set the lower and upper bound
lb = [200 0.05];
ub = [200 0.2];

%several parameters for GA optimization
options = gaoptimset('PopulationSize',60,'PlotFcns',@gaplotpareto, 'MutationFcn', {@mutationadaptfeasible, 0.05},'TimeLimit',60);

[x,fval,exitflag,output,population,scores] = gamultiobj(@evaluator3,2,[],[],[],[],lb,ub,options)