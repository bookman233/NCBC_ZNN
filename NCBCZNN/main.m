close all
clear
clc

tspan = [0 1.5];
gamma = 20;
options = odeset();
for index=1:4
    X0 = 5 * (rand(16,1) - 0.5 * ones(16,1));
    [t, X] = ode45(@ZnnRight_NCZNN, tspan, X0, options, gamma);

    count = 1;
    for i=1:4
        for j = 1:4
            figure(count);
            set(gca,'FontSize',14, 'looseInset',[0 0 0 0])
            plot(t, X(:,count), 'LineWidth', 2);

            txt = {'{\itt} (s)'};
            text(0.6,0,txt)
            txt = {['{\itX}_{',num2str(i),num2str(j),'}','({\itt})']};
            text(1,0.3,txt)
            hold on;
            path = ['Repo/',num2str(count)];
            savefig(path);
            count = count + 1;
        end
   end
end