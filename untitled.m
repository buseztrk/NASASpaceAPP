% 24 saatlik zaman ekseni
hours = 0:23;

% Rastgele veriler üretelim (gerçekçi aralıklarla)
CO2 = 400 + randn(1,24)*50;       % ppm (normalde 400-1000 arası kabul edilebilir)
O2  = 20.5 + randn(1,24)*0.2;     % % hacim
Pressure = 101 + randn(1,24)*0.5; % kPa
Temp = 22 + randn(1,24)*1;        % °C
Humidity = 45 + randn(1,24)*5;    % %

% Kritik eşik değerleri
CO2_limit = 1000;
O2_limit_low = 19.5;
O2_limit_high = 23.5;
Pressure_low = 97; 
Pressure_high = 103;
Temp_low = 18;
Temp_high = 27;
Humidity_low = 30;
Humidity_high = 60;

figure;

%% CO2 grafiği
subplot(3,2,1);
hold on;
for i=1:24
    if CO2(i) > CO2_limit
        plot(hours(i), CO2(i), 'ro', 'MarkerFaceColor','r');
    else
        plot(hours(i), CO2(i), 'go', 'MarkerFaceColor','g');
    end
end
plot(hours,CO2,'b-');
title('CO₂ Seviyesi (ppm)');
xlabel('Saat'); ylabel('ppm');
yline(CO2_limit,'r--','Limit');

%% O2 grafiği
subplot(3,2,2);
hold on;
for i=1:24
    if O2(i) < O2_limit_low || O2(i) > O2_limit_high
        plot(hours(i), O2(i), 'ro','MarkerFaceColor','r');
    else
        plot(hours(i), O2(i), 'go','MarkerFaceColor','g');
    end
end
plot(hours,O2,'b-');
title('O₂ Seviyesi (%)');
xlabel('Saat'); ylabel('%');
yline(O2_limit_low,'r--','Alt Limit');
yline(O2_limit_high,'r--','Üst Limit');

%% Basınç grafiği
subplot(3,2,3);
hold on;
for i=1:24
    if Pressure(i) < Pressure_low || Pressure(i) > Pressure_high
        plot(hours(i), Pressure(i), 'ro','MarkerFaceColor','r');
    else
        plot(hours(i), Pressure(i), 'go','MarkerFaceColor','g');
    end
end
plot(hours,Pressure,'b-');
title('Basınç (kPa)');
xlabel('Saat'); ylabel('kPa');
yline(Pressure_low,'r--','Alt Limit');
yline(Pressure_high,'r--','Üst Limit');

%% Sıcaklık grafiği
subplot(3,2,4);
hold on;
for i=1:24
    if Temp(i) < Temp_low || Temp(i) > Temp_high
        plot(hours(i), Temp(i), 'ro','MarkerFaceColor','r');
    else
        plot(hours(i), Temp(i), 'go','MarkerFaceColor','g');
    end
end
plot(hours,Temp,'b-');
title('Sıcaklık (°C)');
xlabel('Saat'); ylabel('°C');
yline(Temp_low,'r--','Alt Limit');
yline(Temp_high,'r--','Üst Limit');

%% Nem grafiği
subplot(3,2,5);
hold on;
for i=1:24
    if Humidity(i) < Humidity_low || Humidity(i) > Humidity_high
        plot(hours(i), Humidity(i), 'ro','MarkerFaceColor','r');
    else
        plot(hours(i), Humidity(i), 'go','MarkerFaceColor','g');
    end
end
plot(hours,Humidity,'b-');
title('Nem (%)');
xlabel('Saat'); ylabel('%');
yline(Humidity_low,'r--','Alt Limit');
yline(Humidity_high,'r--','Üst Limit');
