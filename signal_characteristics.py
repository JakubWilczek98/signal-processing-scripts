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
    plt.show()
    
def draw_step(tf,name):
    #Step response 
    t, y = signal.step(tf)
    plt.title("Step response - " + name)
    plt.plot(t,y)
    plt.xlabel("Time [s]")
    plt.ylabel("Amplitude")
    plt.grid()
    plt.show()

if __name__ == "__main__":
    #Data
    R = 800
    C = 1.5e-6
    
    #Inertial system of the first order 
    L_rc = 1
    M_rc = np.array([R*C, 1])
    tf_rc = tf(L_rc,M_rc)
    draw_impulse(tf_rc, "Inertial system of the first order")
    draw_step(tf_rc, "Inertial system of the first order")
    
    
    #Differential system
    L_r = np.array([R*C,0])
    M_r = np.array([R*C,1])
    tf_r = tf(L_r,M_r)
    draw_impulse(tf_r, "Differential system")
    draw_step(tf_r, "Differential system")
    
    