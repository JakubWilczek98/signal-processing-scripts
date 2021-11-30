import scipy
import numpy as np
from scipy import signal
import matplotlib.pyplot as plt

def draw_impulse(t,y,name):
    #Impulse response 
    plt.title("Impulse response - " + name)
    plt.plot(t,y)
    plt.xlabel("Time [s]")
    plt.ylabel("Amplitude")
    plt.grid()
    plt.show()
    
def draw_step(t,y,name):
    #Step response 
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
    tf_rc = signal.TransferFunction(L_rc, M_rc)
    t1_im, y1_im = signal.impulse(tf_rc)
    t1_stp, y1_stp = signal.step(tf_rc)
    draw_impulse(t1_im, y1_im, "Inertial system of the first order")
    draw_step(t1_stp, y1_stp, "Inertial system of the first order")
    
    
    #Differential system
    L_r = np.array([R*C,0])
    M_r = np.array([R*C,1])
    t_r = signal.TransferFunction(L_r,M_r)
    t2_im, y2_im = signal.impulse(tf_rc)
    t2_stp, y2_stp = signal.step(tf_rc)
    draw_impulse(t2_im, y2_im, "Differential system")
    draw_step(t2_stp, y2_stp, "Differential system")
    
    