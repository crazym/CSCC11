% Use learnLogReg() to test performance on various datasets.
figure(1);clf;

load('a2/dataSets/generic1');

x1 = c1_train;
x2 = c2_train;

alphas = [0.25, 0.5, 1, 2, 5];

g1E = [];

n1 = size(c1_test, 2);
n2 = size(c2_test, 2);
    
for i = 1:numel(alphas)    
    num_error = 0;
    
    testTargets = [ones(1, n1) zeros(1, n2)];

    for j = 1:(n1+n2)
        [w,b] = learnLogReg(x1,x2,alphas(i));
        p = logistic([c1_test c2_test], w, b)
        
        if round(p(j)) ~= testTargets(j)
            num_error = num_error + 1;
        end
    end
    g1E = [g1E; alphas(i) num_error/(n1+n2)];
end

plot(g1E(:, 1), g1E(:, 2), '--ms');
hold on;
% =======================================================

load('a2/dataSets/generic2');

x1 = c1_train;
x2 = c2_train;

g2E = [];

n1 = size(c1_test, 2);
n2 = size(c2_test, 2);
    
for i = 1:numel(alphas)    
    num_error = 0;
    
    testTargets = [ones(1, n1) zeros(1, n2)];

    for j = 1:(n1+n2)
        [w,b] = learnLogReg(x1,x2,alphas(i));
        p = logistic([c1_test c2_test], w, b)
        
        if round(p(j)) ~= testTargets(j)
            num_error = num_error + 1;
        end
    end
    g2E = [g2E; alphas(i) num_error/(n1+n2)];
end

plot(g2E(:, 1), g2E(:, 2), '--bs');
hold on;

% =======================================================
load('a2/dataSets/fruit_train');
load('a2/dataSets/fruit_test');

E = [];

c1 = find(target_train(1,:)==1);
c2 = find(target_train(2,:)==1);
x1 = inputs_train(:,c1);
x2 = inputs_train(:,c2);

for i = 1:numel(alphas)    
    num_error = 0;
    
    testTargets = [ones(1, n1) zeros(1, n2)];

    for j = 1:size(inputs_test, 2)
        [w,b] = learnLogReg(x1,x2,alphas(i));
        p = logistic(inputs_test, w, b)
        
        if round(p(j)) ~= target_test(j)
            num_error = num_error + 1;
        end
    end
    E = [E; alphas(i) num_error/size(inputs_test, 2)];
end

plot(E(:, 1), E(:, 2), '--go');
hold on;
% =======================================================
load('a2/dataSets/mnist_train');
load('a2/dataSets/mnist_test');

E = [];

c1 = find(target_train(1,:)==1);
c2 = find(target_train(2,:)==1);
x1 = inputs_train(:,c1);
x2 = inputs_train(:,c2);

for i = 1:numel(alphas)    
    num_error = 0;
    
    testTargets = [ones(1, n1) zeros(1, n2)];

    for j = 1:size(inputs_test, 2)
        [w,b] = learnLogReg(x1,x2,alphas(i));
        p = logistic(inputs_test, w, b)
        
        if round(p(j)) ~= target_test(j)
            num_error = num_error + 1;
        end
    end
    E = [E; alphas(i) num_error/size(inputs_test, 2)];
end

plot(E(:, 1), E(:, 2), '--yo');

legend('generic1', 'generic2', 'fruits', 'digits');
xlabel('k');
ylabel('test error');
title('Test Error of LG as a function of alpha^2');;