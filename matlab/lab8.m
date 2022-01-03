clear all;
clc;
close all;

%% Zad 1 Charakterysyki oraz stabilnosc układu
%Filtr o skonczonej odpowiedzi impulsowej rzedu 8

B1 = [-0.005717, -0.02166, -0.06795, -0.1233, 0.8516, -0.1233, -0.06795, -0.02166, -0.005717];
A1 = 1;
Fs = 1000;

%Impuls response
[y1_i, t1_i] = impz(B1,A1);

% Charakterystyki

[h1, w1] = freqz(B1,A1);

%Czestotliwosc
f1 = (w1*Fs)/(2*pi);

% Wykresy

%Uklad 1
figure(1)
sgtitle('Uklad nr 1');
subplot(3,1,1)
stem(t1_i, y1_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(3,1,2)
plot(f1, 20*log10(abs(h1)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(3,1,3)
plot(f1, 180*angle(h1)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

% Stabilnosc
roots_B1 = roots(B1);
roots_A1 = roots(A1);

% Koło jednostkowe
t_jednostkowe=0:2*pi/1000:2*pi;
r=1;
x_jednostkowe=r*cos(t_jednostkowe);
y_jednostkowe=r*sin(t_jednostkowe);

%Stabilnosc ukladu 1
figure(2)
plot(roots_B1, 'o');
title("Stabilnosc ukladu nr 1")
hold on; 
plot(roots_A1, 'x');
hold on; 
plot(x_jednostkowe,y_jednostkowe);
hold on; 
grid on;

%% Zadanie 2 - metoda okien
fs = 1000;
N2 = 32;
fo1 = 150;
wn2 = (2*fo1)/fs;
A2 = 1;

B2_hamm = fir1(N2,wn2,hamming(N2+1));
B2_hann = fir1(N2,wn2,hann(N2+1));
B2_czeby = fir1(N2,wn2,chebwin(N2+1));


%Impuls response
[y2_i, t2_i] = impz(B2_hamm,A2);
[y3_i, t3_i] = impz(B2_hann,A2);
[y4_i, t4_i] = impz(B2_czeby,A2);

%Charakterystyki

[h2, w2] = freqz(B2_hamm,A2);
[h3, w3] = freqz(B2_hann,A2);
[h4, w4] = freqz(B2_czeby,A2);

%Czestotliwosc
f2 = (w2*fs)/(2*pi);
f3 = (w3*fs)/(2*pi);
f4 = (w4*fs)/(2*pi);

% Wykresy
% Hamminga
figure(3)
sgtitle('Uklad Hamminga');
subplot(3,1,1)
stem(t2_i, y2_i)
title("Odpowiedz impulsowa")
xlabel("Czas [s]")
ylabel("Amplituda")
grid minor;

subplot(3,1,2)
plot(f2, 20*log10(abs(h2)));
title("Charakterystyka amplitudowo - czestotliwosciowa")
xlabel("Freq [Hz]")
ylabel("Amplituda [dB]")
grid minor;

subplot(3,1,3)
plot(f2, 180*angle(h2)/pi);
title("Charakterystyka amplitudowo - fazowa")
xlabel("Freq [Hz]")
ylabel("Faza [stopnie]")
grid minor;

% Stabilnosc
roots_B2 = roots(B2_hamm);
roots_A2 = roots(A2);

% Koło jednostkowe
t_jednostkowe=0:(2*pi)/1000:2*pi;
r=1;
x_jednostkowe=r*cos(t_jednostkowe);
y_jednostkowe=r*sin(t_jednostkowe);

%Stabilnosc ukladu Hamminga
figure(4)
plot(roots_B2, 'o');
title("Stabilnosc filtr Hamminga")
hold on; 
plot(roots_A2, 'x');
hold on; 
plot(x_jednostkowe,y_jednostkowe);
hold on; 
grid on;


% Hanninga
figure(5)
sgtitle('Uklad Hanninga');
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
roots_B3 = roots(B2_hann);
roots_A2 = roots(A2);

% Koło jednostkowe
t_jednostkowe=0:(2*pi)/1000:2*pi;
r=1;
x_jednostkowe=r*cos(t_jednostkowe);
y_jednostkowe=r*sin(t_jednostkowe);

%Stabilnosc ukladu 1
figure(6)
plot(roots_B3, 'o');
title("Stabilnosc filtr Hamminga")
hold on; 
plot(roots_A2, 'x');
hold on; 
plot(x_jednostkowe,y_jednostkowe);
hold on; 
grid on;

% Czebyszewa
figure(7)
sgtitle('Uklad Czebyszewa');
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
roots_B4 = roots(B2_czeby);
roots_A2 = roots(A2);

% Koło jednostkowe
t_jednostkowe=0:(2*pi)/1000:2*pi;
r=1;
x_jednostkowe=r*cos(t_jednostkowe);
y_jednostkowe=r*sin(t_jednostkowe);

%Stabilnosc ukladu 1
figure(8)
plot(roots_B4, 'o');
title("Stabilnosc filtr Czebyszewa")
hold on; 
plot(roots_A2, 'x');
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

%Filtr o skonczonej odpowiedzi impulsowej rzedu 8
y_filter_1 = filter(B1,A1,y);
N1 = length(y_filter_1);
S1 = fft(y_filter_1);
widmo_fft_S1 = sqrt(S1.*conj(S1))/N1;
F1 = fs*(0:N1/2-1)/N1;
widmo1 = widmo_fft_S1(1:N1/2);

figure(9)
sgtitle('Filtr o skonczonej odpowiedzi impulsowej rzedu 8')
subplot(2,1,1)
plot(time,y_filter_1)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F1,widmo1)
title('Widmo sygnalu po filtracji filtrem o skonczonej odpowiedzi impulsowej rzedu 8')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on;

%Filtry z zad 2
%Hamminga
y_filter_2 = filter(B2_hamm,A2,y);
N2 = length(y_filter_2);
S2 = fft(y_filter_2);
widmo_fft_S2 = sqrt(S2.*conj(S2))/N2;
F2 = fs*(0:N2/2-1)/N2;
widmo2 = widmo_fft_S2(1:N2/2);

figure(10)
sgtitle('Filtr Hamminga')
subplot(2,1,1)
plot(time,y_filter_2)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F2,widmo2)
title('Widmo sygnalu po filtracji filtrem Hamminga')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on;

%Hanninga
y_filter_3 = filter(B2_hann,A2,y);
N3 = length(y_filter_3);
S3 = fft(y_filter_3);
widmo_fft_S3 = sqrt(S3.*conj(S3))/N3;
F3 = fs*(0:N3/2-1)/N3;
widmo3 = widmo_fft_S3(1:N3/2);

figure(11)
sgtitle('Filtr Hanninga')
subplot(2,1,1)
plot(time,y_filter_3)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F3,widmo3)
title('Widmo sygnalu po filtracji filtrem Hanninga')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on;

%Czebyszewa
y_filter_4 = filter(B2_czeby,A2,y);
N4 = length(y_filter_4);
S4 = fft(y_filter_4);
widmo_fft_S4 = sqrt(S4.*conj(S4))/N4;
F4 = fs*(0:N4/2-1)/N4;
widmo4 = widmo_fft_S4(1:N4/2);

figure(12)
sgtitle('Filtr Czebyszewa')
subplot(2,1,1)
plot(time,y_filter_4)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F4,widmo4)
title('Widmo sygnalu po filtracji filtrem Czebyszewa')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on;


