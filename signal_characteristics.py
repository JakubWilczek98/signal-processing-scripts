import scipy
import numpy as np
from scipy import signal
import matplotlib.pyplot as plt

def tf(L,M):
    return signal.TransferFunction(L,M)

def draw_impulse(tf,name):
    #Impulse response
    t, y = signal.impulse(tf)
    plt.title("Impulse response - " + name)
    plt.plot(t,y)
    plt.xlabel("Time [s]")
    plt.ylabel("Amplitude")
    plt.grid()
    plt.savefig("Impulse response - " + name + ".png")
    plt.show()
    
    
def draw_step(tf,name):
    #Step response 
    t, y = signal.step(tf)
    plt.title("Step response - " + name)
    plt.plot(t,y)
    plt.xlabel("Time [s]")
    plt.ylabel("Amplitude")
    plt.grid()
    plt.savefig("Step response - " + name + ".png")
    plt.show()
    
def draw_freqs(L,M, name):
    w, h = signal.freqs(L,M) #Module and phase of complex
    f = w/(2*np.pi)
    
    fig, axs = plt.subplots(2, 1, constrained_layout=True)
    axs[0].plot(f,20*np.log10(abs(h)))
    axs[0].set_title('Amplitude-frequency characteristics ')
    axs[0].set_xlabel("Time [s]")
    axs[0].set_ylabel("Amplitude [dB]")
    axs[0].grid()
    fig.suptitle('Characteristics of ' + name, fontsize=16)
    
    axs[1].plot(f,180*np.angle(h))
    axs[1].set_xlabel("Time [s]")
    axs[1].set_title('Phase-frequency characteristics ')
    axs[1].set_ylabel("Phase")
    axs[1].grid()
    plt.savefig('Phase-frequency characteristics' + name + ".png")
    plt.show()

if __name__ == "__main__":
    #Data
    R = 800
    L = 0.8
    C = 1.5e-6
    
    #Inertial system of the first order [RC]
    L_rc = np.array([1])
    M_rc = np.array([R*C, 1])
    tf_rc = tf(L_rc,M_rc)
    draw_impulse(tf_rc, "Inertial system of the first order")
    draw_step(tf_rc, "Inertial system of the first order")
    draw_freqs(L_rc, M_rc, "Inertial system of the first order")
    
    
    #Differential system
    L_r = np.array([R*C,0])
    M_r = np.array([R*C,1])
    tf_r = tf(L_r,M_r)
    draw_impulse(tf_r, "Differential system")
    draw_step(tf_r, "Differential system")  
    draw_freqs(L_r,M_r, "Differential system")
    
    #RLC 
    L_rlc = np.array([1])
    M_rlc = np.array([L*C,R*C, 1])
    tf_rlc = tf(L_rlc,M_rlc)
    draw_impulse(tf_rlc, "RLC")
    draw_step(tf_rlc, "RLC")
    draw_freqs(L_rlc, M_rlc, "RLC")
    