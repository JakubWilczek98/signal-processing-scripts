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
        
if __name__ == "__main__":
    A = [1]
    B = [-0.005717, -0.02166, -0.06795, -0.1233, 0.8516, -0.1233, -0.06795, -0.02166, -0.005717]
    Fs = 1000
    draw_freqz(B, A, Fs, "System 1")
    
    draw_impz(B, A, "System 1")    
    stability(B, A, "System 1")
    
    
    
    