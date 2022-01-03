clc;
clear all;
close all; 

%% Wyznacz splot sygnalow za pomoca funkcji wbudowanej oraz wlasnej

A=[0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0];
B=[1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1];
convulsion_m = conv(A,B);

B = B(end:-1:1);
newL = length(A) + (2*(length(B)-1));
newA = zeros(1,newL);
newB = zeros(1,newL);

for i = 1:length(A)
    newA(length(B)-1+i) = A(i);
end


dl=(newL-length(B)+1);
wynik = [];
for k = 0:dl-1
    u = 1;
    for j = 1:length(B)
        newB(u+k) = B(u); 
        u = u + 1;
    end
    wynik = [wynik, sum(newA.*newB)]
    
    newB = zeros(1,newL);
end

convulsion_w = wynik;

g = [convulsion_w; convulsion_m];


%% Zad 3 Wygeneruj sygnaly losowe o rozkl normalnym i rownomiernym 

n = 1000; %Dlugosc sygnalu
time = 1:1:1000;
rozkl_rownomierny = rand(1,n);
rozkl_normalny=randn(1,n);

figure(1)
subplot(2,1,1)
plot(rozkl_rownomierny)
title("Sygnal losowy o rozkladzie rownomiernym")
xlabel("Próbka [n]")
ylabel("Amplituda")
grid on;
subplot(2,1,2)
plot(rozkl_normalny)
title("Sygnal losowy o rozkladzie normalnym")
xlabel("Próbka [n]")
ylabel("Amplituda")
grid on;

%% Wartości minimalne

sygnaly=[rozkl_rownomierny;rozkl_normalny];

for i = 1:2
    sygnal = sygnaly(:,i);
    min_w(i)=f_min(sygnal,length(sygnal));
    min_m(i)=min(sygnal);
 end

%% Wartosci maksymalne 

for i = 1:2
    sygnal = sygnaly(:,i);
    max_w(i)=f_max(sygnal,length(sygnal));
    max_m(i)=max(sygnal);
end

%% Wartosci srednie 

for i = 1:2
    sygnal = sygnaly(:,i);
    mean_w(i)=f_sr(sygnal,length(sygnal));
    mean_m(i)=mean(sygnal);
end

%% Wartosci energii sygnalu

for i = 1:2
    sygnal = sygnaly(:,i);
    energia_w(i)=f_energia(sygnal,length(sygnal));
    energia_m(i)=sum(sygnal.*sygnal);
end

%% Wartosci wariancji sygnalu

for i = 1:2
    sygnal = sygnaly(:,i);
    wariancja_w(i)=f_wariancja(sygnal);
    wariancja_m(i)=var(sygnal);
end

%% Wartosci odchylenia standardowego 

for i = 1:2
    sygnal = sygnaly(:,i);
    odchyleniestd_w(i)=f_odchylenie(sygnal);
    odchylenie_m(i)=std(sygnal);
end

%% Wartość mocy sygnały

for i = 1:2
    sygnal = sygnaly(:,i);
    energia_m(i)=sum(sygnal.*sygnal);
    moc_w(i)=f_moc(sygnal,length(sygnal),time);
    moc_m(i)=energia_m(i)/time(end);
end


%% Wartości momentów zwykłych przy pomocy funkcji matlaba

for i = 1:2
    sygnal = sygnaly(:,i);
    moment_zwykly_m_1(i)=mean(sygnal.^1); %Rzedu pierwszego
    moment_zwykly_m_2(i)=mean(sygnal.^2); %Rzedu drugiego
    moment_zwykly_m_3(i)=mean(sygnal.^3); %Rzedu trzeciego
end

%% Wartości momentów centralnych przy pomocy funkcji matlaba

for i = 1:2
    sygnal = sygnaly(:,i);
    moment_centralny_m_1(i)=moment(sygnal,1); %Rzedu pierwszego
    moment_centralny_m_2(i)=moment(sygnal,2); %Rzedu drugiego
    moment_centralny_m_3(i)=moment(sygnal,3); %Rzedu trzeciego
end


