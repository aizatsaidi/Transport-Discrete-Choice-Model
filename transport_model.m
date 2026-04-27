clc;
clear;

disp("==== Transport Discrete Choice Model ====");

% === Step 1: Number of users ===
n = input("Enter number of users: ");

% === Step 2: Initialize storage ===
% Rows = transport, Columns = attributes
% [Food, Journey, Driving, Cost]

E = zeros(n,4);
S = zeros(n,4);
P = zeros(n,4);
C = zeros(n,4);

% === Step 3: Input loop ===
for i = 1:n
    printf("\n--- User %d ---\n", i);

    disp("Rate from 1 (low) to 5 (high)");

    % E-hailing
    disp("E-hailing-->");
    E(i,1) = input("Food availability: ");
    E(i,2) = input("Journey experience: ");
    E(i,3) = input("Driving experience: ");
    E(i,4) = input("Cost: ");

    % Self-drive
    disp("Self-drive-->");
    S(i,1) = input("Food availability: ");
    S(i,2) = input("Journey experience: ");
    S(i,3) = input("Driving experience: ");
    S(i,4) = input("Cost: ");

    % Public transport
    disp("Public transport-->");
    P(i,1) = input("Food availability: ");
    P(i,2) = input("Journey experience: ");
    P(i,3) = input("Driving experience: ");
    P(i,4) = input("Cost: ");

    % Carpool
    disp("Carpool-->");
    C(i,1) = input("Food availability: ");
    C(i,2) = input("Journey experience: ");
    C(i,3) = input("Driving experience: ");
    C(i,4) = input("Cost: ");
end

% === Step 4: Average scores ===
E_avg = mean(E);
S_avg = mean(S);
P_avg = mean(P);
C_avg = mean(C);

% === Step 5: Total utility (sum of attributes) ===
U = [
    sum(E_avg);
    sum(S_avg);
    sum(P_avg);
    sum(C_avg)
];

% === Step 6: Convert to percentage ===
total = sum(U);
percentage = (U / total) * 100;

labels = {"E-hailing", "Self-drive", "Public Transport", "Carpool"};

% === Step 7: Display results ===
disp(" ");
disp("=== Average Percentage Results ===");

for i = 1:4
    printf("%s: %.2f%%\n", labels{i}, percentage(i));
end

% === Step 8: Recommendation ===
[max_val, index] = max(U);

disp(" ");
printf("Recommended Transport: %s\n", labels{index});

% === Step 9: Bar chart ===
figure;
bar(percentage);
set(gca, 'XTickLabel', labels);
ylabel('Percentage (%)');
title('Transport Choice Ranking');
