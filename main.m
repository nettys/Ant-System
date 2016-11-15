clc;
clear;
close all;

%cities
%10
%cities = [1 3; 1 7; 3 9; 5 3; 7 1; 9 5; 9 9; 11 1; 15 7; 19 3];
%ei51
%cities = [37 52;49 49;52 64;20 26;40 30;21 47;17 63;31 62;52 33;51 21;42 41;31 32;5 25;12 42;36 16;52 41;27 23;17 33;13 13;57 58;62 42;42 57;16 57;8 52;7 38;27 68;30 48;43 67;58 48;58 27;37 69;38 46;46 10;61 33;62 63;63 69;32 22;45 35;59 15;5 6;10 17;21 10;5 64;30 15;39 10;32 39;25 32;25 55;48 28;56 37;30 40];
%berlin52
%cities = [565 575;25 185;345 750;945 685;845 655;880 660;25 230;525 1000;580 1175;650 1130;1605 620;1220 580;1465 200;1530 5;845 680;725 370;145 665;415 635;510 875;560 365;300 465;520 585;480 415;835 625;975 580;1215 245;1320 315;1250 400;660 180;410 250;420 555;575 665;1150 1160;700 580;685 595;685 610;770 610;795 645;720 635;760 650;475 960;95 260;875 920;700 500;555 815;830 485;1170 65;830 610;605 625;595 360;1340 725;1740 245];
cities = csvread('berlin52.csv');
bks = 7542;
city.x = cities(:,1)';
city.y = cities(:,2)';


%Distance Matrix
D = squareform(pdist(cities));

%Init
n = length(cities);
maxCycle = 1000;
%tau0 = 0.01;
tau0 = 1/(n*bks);

tau = tau0 * ones(n, n); %pheromone matrix
tau(eye(size(tau))~=0) = 0;

eta = 1./D;
bestCost = zeros(maxCycle,1);

%Constants (BERLIN52)
% alpha = 1;
% beta = 2;
% rho = 0.7;
% Q = 10;

%Constants
alpha = 1;
beta = 2;
rho = 0.9;
Q = 100;

%Ant
ant.Tabu = [];
ant.L = [];

ants = repmat(ant, n, 1);
nAnts = length(cities);

%Best Solution
bestSolutions = zeros(maxCycle,1);
bestAnt.L = inf;

%Main Iteration
for t=1:maxCycle
    %Loop of Ants
    startCity = zeros(nAnts,1);
    for k=1:nAnts        
        flag = 1;
        while flag
            startPosition = randi(n);
            if any(startCity == startPosition)
                
            else
                ants(k).Tabu = randi(n);
                startCity(k,1)= startPosition;
                flag = 0;
            end
            
        end
        
        
        
        for l=2:n
            currentCity = ants(k).Tabu(end);
            unVisitedCity = setdiff(1:n,ants(k).Tabu);
            p=tau(currentCity,unVisitedCity).^alpha .* eta(currentCity,unVisitedCity).^beta;          
            
            if sum(p) ~= 0
                p = p./sum(p);
            else
                p = ones(length(p),1)/length(p);
                
            end
            
                        
            j = nextCity(p,unVisitedCity);
            ants(k).Tabu = [ants(k).Tabu j];
        
        end
        
        %length/cost        
        L = 0;
        tabu = [ants(k).Tabu ants(k).Tabu(1)];
        for i=1:n            
            L = L + round(D(tabu(i), tabu(i+1)));
        end
        
        ants(k).L = L;
        
        if ants(k).L < bestAnt.L
            bestAnt = ants(k);
        end      
        
    end
    
    %evaporation
    tau = rho .* tau;
    
    for k=1:nAnts    
        tabuList = [ants(k).Tabu ants(k).Tabu(1)];
        for l=1:n
            i = tabuList(l);
            j = tabuList(l+1);
            tau(i,j) = tau(i,j) + (Q/ants(k).L);
            tau(j,i) = tau(i,j);
        end        
    end
    
    bestSolutions(t) = bestAnt.L;
    disp(['Iteration ' num2str(t) ': Best Cost = ' num2str(bestSolutions(t))]);
    
    %figure(1);
    %PlotTravel(city, ants(k).Tabu);
    %pause(0.01);
end


%results
figure(2);
plot(bestSolutions, 'LineWidth', 3);
xlabel('Number of Iterations');
ylabel('Best Cost');
grid on;

