% Extract data from simulation output
alpha_dot = out.ScopeData{1}.Values.Data;
alpha     = out.ScopeData{2}.Values.Data;
t         = out.ScopeData{1}.Values.Time;  % Assuming both signals share the same time vector

% Create figure and plot the data
figure;
plot(t, alpha_dot, 'LineWidth', 1.5); 
hold on;
plot(t, alpha, 'LineWidth', 1.5);

% Set legend with Palatino font
legend('Angular Rate', 'Angle of Attack', 'FontSize', 14, 'FontName', 'Palatino');

% Label axes and add title with Palatino font
xlabel('Time (s)', 'FontSize', 14, 'FontName', 'Palatino');
ylabel('Response', 'FontSize', 14, 'FontName', 'Palatino');
title('System Response', 'FontSize', 14, 'FontName', 'Palatino');

% Calculate step response characteristics for "alpha"
info = stepinfo(alpha, t);
settlingTime = info.SettlingTime;
riseTime = info.RiseTime;

% Create an annotation textbox to display settling and rise times
str = sprintf('Settling Time: %.2f s\nRise Time: %.2f s', settlingTime, riseTime);
annotation('textbox', [0.15, 0.6, 0.3, 0.3], 'String', str, ...
    'FitBoxToText', 'on', 'FontSize', 14, 'FontName', 'Palatino', ...
    'BackgroundColor', 'white');

hold off;
%saveas(gcf, 'system_response_controller_2_fixed_omega_n.png');