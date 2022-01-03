clc;
clear all;
close all;

%% zad 7 
fs = 1000;


fo1 = 200;
fo2 = 300;
wn1 = (2*fo1)/fs;
wn2= (2*fo2)/fs;
N = 32;
R1 = 1;
A = 1;


%Filtry fir 1
B_fir1_LP_cheby =fir1(N, wn1, 'low',chebwin(N+1));
B_fir1_HP_cheby =fir1(N, wn1, 'high',chebwin(N+1));
B_fir1_BP_cheby =fir1(N, [wn1, wn2], 'bandpass',chebwin(N+1));
B_fir1_BS_cheby =fir1(N, [wn1 ,wn2], 'stop',chebwin(N+1));

B_fir1_LP_hamm =fir1(N, wn1, 'low',hamming(N+1));
B_fir1_HP_hamm =fir1(N, wn1, 'high',hamming(N+1));
B_fir1_BP_hamm =fir1(N, [wn1, wn2], 'bandpass',hamming(N+1));
B_fir1_BS_hamm =fir1(N, [wn1 ,wn2], 'stop',hamming(N+1));

B_fir1_LP_hann =fir1(N, wn1, 'low',hann(N+1));
B_fir1_HP_hann =fir1(N, wn1, 'high',hann(N+1));
B_fir1_BP_hann =fir1(N, [wn1, wn2], 'bandpass',hann(N+1));
B_fir1_BS_hann =fir1(N, [wn1 ,wn2], 'stop',hann(N+1));

%% Filtracja sygnału wybierajac filter
% Przykladowy sygnal poli
ft_1 = 100;
ft_2 = 250;
ft_3 = 400;

time =0:1/fs:1.023;

Amp1 = 1;

omega1 = 2*pi*ft_1;
omega2 = 2*pi*ft_2;
omega3 = 2*pi*ft_3;

y = Amp1*sin(omega1*time)+Amp1*sin(omega2*time)+Amp1*sin(omega3*time);

N_original = length(y);
S_o = fft(y);
widmo_fft_S_o = (S_o.*conj(S_o))/N_original;
F_original = fs*(0:N_original/2-1)/N_original;
widmo_o = widmo_fft_S_o(1:N_original/2);


y_filter = filter(B_fir1_LP_cheby, A, y);
N_filter = length(y_filter);
S = fft(y_filter);
widmo_fft_S = (S.*conj(S))/N_filter;
F_filter = fs*(0:N_filter/2-1)/N_filter;
widmo = widmo_fft_S(1:N_filter/2);

figure(10)
sgtitle('Filtr B fir1 LP cheby')
subplot(2,1,1)
plot(time,y_filter)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F_filter,widmo)
title('Widmo sygnalu po filtracji filtrem Hamminga')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on;

figure(11)
sgtitle('Original')
subplot(2,1,1)
plot(time,y)
title('Sygnal')
xlabel('Czas [s]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
plot(F_original,widmo_o)
title('Widmo original')
xlabel('Czestotliwosc [Hz]')
ylabel('Amplituda')
grid on;


