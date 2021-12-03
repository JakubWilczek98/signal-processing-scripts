from scipy import signal
import numpy as np
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
    
        
if __name__ == "__main__":
    #A = [1]
    #B = [-0.005717, -0.02166, -0.06795, -0.1233, 0.8516, -0.1233, -0.06795, -0.02166, -0.005717]
    
    B = np.array([2.395964410376595e-05,
    1.916771528301276e-04,
    6.708700349054465e-04,
    1.341740069810893e-03,
    1.677175087263616e-03,
    1.341740069810893e-03,
    6.708700349054465e-04,
    1.916771528301276e-04,
    2.395964410376595e-05]);
    A = np.array([1.000000000000000e+00, 
    -4.784514894995811e+00,
    1.044504106553467e+01, 
    -1.345771989024157e+01,
    1.112933103916399e+01 ,
    -6.025260397297663e+00,
    2.079273803011882e+00, 
    -4.172171569897832e-01,
    3.720010070484534e-02]);
    
    
    Fs = 1000
    draw_freqz(B, A, Fs, "System 1")
    
    draw_impz(B, A, "System 1")    
    #stability(B, A, "System 1")
    
    stability(B, A, "System 1")
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    