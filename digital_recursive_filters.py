import scipy
import numpy as np
from scipy import signal
import matplotlib.pyplot as plt

def draw_freqz(B,A, Fs, name): 
    wz, hz = signal.freqz(B,A)
    freq = wz*Fs/(2*np.pi)
    
    fig, axs = plt.subplots(2, 1, constrained_layout=True)
    axs[0].plot(freq,20*np.log10(abs(hz)))
    axs[0].set_title('Amplitude-frequency characteristic')
    axs[0].set_xlabel("Frequency (Hz)")
    axs[0].set_ylabel("Amplitude [dB]")
    axs[0].grid()
    fig.suptitle('Characteristics of ' + name, fontsize=16)
    
    axs[1].plot(freq,180*np.angle(hz))
    axs[1].set_xlabel("Frequency (Hz)")
    axs[1].set_title('Phase-frequency characteristic')
    axs[1].set_ylabel("Phase (degree)")
    axs[1].grid()
    #plt.savefig('Phase-frequency characteristics' + name + ".png")
    plt.show()

def draw_impz(B,A, name):
    impulse = np.repeat(0.,32)
    impulse[0] = 1.
    x = np.arange(0,32)
    
    response = signal.lfilter(B,A, impulse)
    step = np.cumsum(response)
    
    fig, axs = plt.subplots(2, 1, constrained_layout=True)
    axs[0].stem(x, response, 'm', use_line_collection=True)
    axs[0].set_title('Impulse response')
    axs[0].set_xlabel("Samples (n)")
    axs[0].set_ylabel("Amplitude")
    axs[0].grid()
    fig.suptitle('Responses of ' + name, fontsize=16)
  
    axs[1].stem(x, step, 'g', use_line_collection=True)
    axs[1].set_xlabel("Samples (n)")
    axs[1].set_title("Step response")
    axs[1].set_ylabel("Amplitude")
    axs[1].grid()
    #plt.savefig('Impulse and step response of ' + name + ".png")
    plt.show()

def stability(B,A, nazwa):
    roots_B = np.roots(B)
    roots_A = np.roots(A)  
    t_jednostkowe = np.arange(0,2*np.pi,2*np.pi/1000)
    r = 1
    x_jednostkowe = r*np.cos(t_jednostkowe)
    y_jednostkowe = r*np.sin(t_jednostkowe)
    plt.plot(roots_B.real,roots_B.imag, 'o')
    plt.plot(roots_A.real,roots_B.imag, 'x')
    plt.plot(x_jednostkowe,y_jednostkowe)
    plt.title("Stability of " + nazwa)
    plt.grid()

 
def butterworth_filter(N, f , fs, b_type): #(row, freq, freqs, s_type('low','high','bandpass','bandstop'))
    if type(f) is not list:
        Wn = (2*f)/fs 
        B, A = signal.butter(N, Wn, b_type)
    else:
        Wn1 = (2*float(f[0]))/fs 
        Wn2 = (2*float(f[1]))/fs
        B, A = signal.butter(N, [Wn1, Wn2], b_type)
    return B, A
        
def cheby_1_filter(N, f , fs, wave, b_type): #(row, freq, freqs, waves in dB)
    if type(f) is not list:
        Wn = (2*f)/fs 
        B, A = signal.cheby1(N, wave, Wn, b_type)
    else:
        Wn1 = (2*float(f[0]))/fs 
        Wn2 = (2*float(f[1]))/fs
        B, A = signal.cheby1(N, wave, [Wn1, Wn2], b_type)
    return B, A   

def cheby_2_filter(N, f , fs, wave, b_type): #(row, freq, freqs, waves in dB)
    if type(f) is not list:
        Wn = (2*f)/fs 
        B, A = signal.cheby2(N, wave, Wn, b_type)
    else:
        Wn1 = (2*float(f[0]))/fs 
        Wn2 = (2*float(f[1]))/fs
        B, A = signal.cheby2(N, wave, [Wn1, Wn2], b_type)
    return B, A   

def ellip_filter(N, f , fs, p_wave, s_wave, b_type):    
    if type(f) is not list:
        Wn = (2*f)/fs 
        B, A = signal.ellip(N, p_wave, s_wave, Wn, b_type)
    else:
        Wn1 = (2*float(f[0]))/fs 
        Wn2 = (2*float(f[1]))/fs
        B, A = signal.ellip(N, p_wave, s_wave, [Wn1, Wn2], b_type)
    return B, A

if __name__ == "__main__":
    Fs = 1000
    
    
    B, A = butterworth_filter(2, 200, 1000, 'low')    
    B1, A1 = cheby_1_filter(2, 200, 1000, 3, 'high')
    B2, A2 = cheby_2_filter(4, [200, 300], 1000, 20, 'bandpass')
    B3, A3 = ellip_filter(4, [200, 300], 1000, 3, 20, 'bandstop')
    
    results = np.array([[B,B1,B2,B3],[A,A1,A2,A3]])
    
    
    names = ['Butterworth filter', 'Cheby 1 filter','Cheby 2 filter','Ellip filter']
    
    i=0
    for name in names: 
        draw_freqz(results[0][i], results[1][i], Fs, names[i])  
        draw_impz(results[0][i], results[1][i], names[i])
        stability(results[0][i], results[1][i], names[i])
        i +=1
        
   
  
    
        
    
    
