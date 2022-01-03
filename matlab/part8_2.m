clc;
clear all;
close all;

%% Zad 3 - Metoda próbkowania w dziedzinie częstotliwości
fs = 1000;
N4 = 32;
A = [1 1 1 1 1 0 0 0 0 0 0 0];
F = [0 0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];

B3 = fir2(N4, F, A);
A3 = 1

%Impuls response
[y3_i, t3_i] = impz(B3,A3);

%Charakterystyki
[h3, w3] = freqz(B3,A3);

%Czestotliwosc
f3 = (w3*fs)/(2*pi);

% Metoda probkowania w dziedzinie czestotliwosci
figure(1)
sgtitle('Filtr metoda probkowania w dziedzinie czestotliwosci');
subplot(3,1,1)
stem(t3_i, y3_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(3,1,2)
plot(f3, 20*log10(abs(h3)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(3,1,3)
plot(f3, 180*angle(h3)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

% Stabilnosc
roots_B3 = roots(B3);
roots_A3 = roots(A3);

% Koło jednostkowe
t_jednostkowe=0:(2*pi)/1000:2*pi;
r=1;
x_jednostkowe=r*cos(t_jednostkowe);
y_jednostkowe=r*sin(t_jednostkowe);

%Stabilnosc ukladu
figure(2)
plot(roots_B3, 'o');
title("Stabilnosc -Filtr metoda probkowania w dziedzinie czestotliwosci")
hold on; 
plot(roots_A3, 'x');
hold on; 
plot(x_jednostkowe,y_jednostkowe);
hold on; 
grid on;

%% Zad 4 - metoda aproksymacji czebyszewa

A4_d = [1 1 1 1 1 0 0 0 0 0 0 0];
F4 = [0 0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
N4 = 32;

B4 = firpm(N4,F4,A4_d);
A4 = 1;

%Impuls response
[y4_i, t4_i] = impz(B4,A4);

%Charakterystyki
[h4, w4] = freqz(B4,A4);

%Czestotliwosc
f4 = (w4*fs)/(2*pi);

% Metoda aproksymacji czebyszewa
figure(3)
sgtitle('Filtr metoda aproksymacji czebyszewa');
subplot(3,1,1)
stem(t4_i, y4_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(3,1,2)
plot(f4, 20*log10(abs(h4)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(3,1,3)
plot(f4, 180*angle(h4)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

% Stabilnosc
roots_B4 = roots(B4);
roots_A4 = roots(A4);

% Koło jednostkowe
t_jednostkowe=0:(2*pi)/1000:2*pi;
r=1;
x_jednostkowe=r*cos(t_jednostkowe);
y_jednostkowe=r*sin(t_jednostkowe);

%Stabilnosc ukladu
figure(4)
plot(roots_B4, 'o');
title("Stabilnosc -Filtr metoda aproksymacji czebyszewa")
hold on; 
plot(roots_A4, 'x');
hold on; 
plot(x_jednostkowe,y_jednostkowe);
hold on; 
grid on;


%% Zad 5 - metoda optymalizacji średniokwadratowej

A5_d = [1 1 1 1 1 0 0 0 0 0 0 0];
F5 = [0 0.05 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
N5 = 32;

B5 = firls(N5,F5,A5_d);
A5 = 1;

%Impuls response
[y5_i, t5_i] = impz(B5,A5);

%Charakterystyki
[h5, w5] = freqz(B5,A5);

%Czestotliwosc
f5 = (w5*fs)/(2*pi);

%metoda optymalizacji średniokwadratowej
figure(5)
sgtitle('Filtr metoda optymalizacji średniokwadratowej');
subplot(3,1,1)
stem(t5_i, y5_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(3,1,2)
plot(f5, 20*log10(abs(h5)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(3,1,3)
plot(f5, 180*angle(h5)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

% Stabilnosc
roots_B5 = roots(B5);
roots_A5 = roots(A5);

% Koło jednostkowe
t_jednostkowe=0:(2*pi)/1000:2*pi;
r=1;
x_jednostkowe=r*cos(t_jednostkowe);
y_jednostkowe=r*sin(t_jednostkowe);

%Stabilnosc ukladu
figure(6)
plot(roots_B5, 'o');
title("Stabilnosc - Filtr metoda optymalizacji średniokwadratowej")
hold on; 
plot(roots_A5, 'x');
hold on; 
plot(x_jednostkowe,y_jednostkowe);
hold on; 
grid on;


%% Testy
ft_1 = 100;
ft_2 = 250;
ft_3 = 400;

time =0:1/fs:1.023;

Amp1 = 1;

omega1 = 2*pi*ft_1;
omega2 = 2*pi*ft_2;
omega3 = 2*pi*ft_3;

y = Amp1*sin(omega1*time)+Amp1*sin(omega2*time)+Amp1*sin(omega3*time);

%Filtr otrzymany metoda próbkowania w dziedzinie częstotliwości
y_filter_1 = filter(B3,A3,y);
N1 = length(y_filter_1);
S1 = fft(y_filter_1);
widmo_fft_S1 = sqrt(S1.*conj(S1))/N1;
F1 = fs*(0:N1/2-1)/N1;
widmo1 = widmo_fft_S1(1:N1/2);

figure(7)
sgtitle('Filtr otrzymany metoda próbkowania w dziedzinie częstotliwości')
subplot(2,1,1)
plot(time,y_filter_1)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F1,widmo1)
title('Widmo sygnalu po filtracji filtrem, otrzymanym metoda próbkowania w dziedzinie częstotliwości')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on;


%Filtr otrzymany metodą aproksymacji czebyszewa
y_filter_2 = filter(B4,A4,y);
N2 = length(y_filter_2);
S2 = fft(y_filter_2);
widmo_fft_S2 = sqrt(S2.*conj(S2))/N2;
F2 = fs*(0:N2/2-1)/N2;
widmo2 = widmo_fft_S2(1:N2/2);

figure(8)
sgtitle('Filtr otrzymany metodą aproksymacji czebyszewa')
subplot(2,1,1)
plot(time,y_filter_2)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F2,widmo2)
title('Widmo sygnalu po filtracji filtrem otrzymanym metodą aproksymacji czebyszewa')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on;

%Filtr otrzymany metoda optymalizacji sredniokwadratowej 
y_filter_3 = filter(B5,A5,y);
N3 = length(y_filter_3);
S3 = fft(y_filter_3);
widmo_fft_S3 = sqrt(S3.*conj(S3))/N3;
F3 = fs*(0:N3/2-1)/N3;
widmo3 = widmo_fft_S3(1:N3/2);

figure(9)
sgtitle('Filtr otrzymany metoda optymalizacji sredniokwadratowej')
subplot(2,1,1)
plot(time,y_filter_3)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F3,widmo3)
title('Filtr otrzymany metoda optymalizacji sredniokwadratoweja')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on;


