import numpy as np
import matplotlib.pyplot as plt


def exp_decreasing_fcn(time):
    exp_decreasing = np.exp(-time)
    
    return exp_decreasing


def sinwave_fcn(amplitude, freq, time):
    omega = 2*np.pi*f1
    sinwave = A*np.sin(omega*time)
    
    return sinwave
 
def hvs_step_fcn(time):
    hvs = np.array(np.zeros((len(time))))
    for i in range(len(time)):
        if time[i] < 0:
            hvs[i] = 0
        elif time[i] > 0:
            hvs[i] = 1
        else:
            hvs[i] = 0.5
            
    return hvs

def signal_composition(y1,y2): #two signals composition
    y_comp = np.zeros((len(y1)))
    for i in range(len(y1)):
        y_comp[i] = y1[i]*y2[i]
    
    return y_comp

def even_and_odd_fcn(signal):
    signal_reverse = np.flip(signal) #time reverse
    xe = (signal + signal_reverse)/2 #Even part
    xo = (signal - signal_reverse)/2 #Odd part
    
    return xe, xo
            
if __name__ == "__main__":
    
    #Data
    f1 = 10
    fs = 1000
    A = 1
    start_time = -5
    end_time = 5
    sample_rate = 1/fs


    #Time vector 
    time = np.arange(start_time,end_time,sample_rate)
    
    #Two signals composition
    y_comp = signal_composition(exp_decreasing_fcn(time),hvs_step_fcn(time))
    #Even, odd
    xe, xo = even_and_odd_fcn(y_comp)
    
    
    #Plots 
    #Exponential decreasing
    plt.figure(1)
    plt.plot(time,exp_decreasing_fcn(time))
    plt.grid()
    plt.suptitle("Exponential decreasing signal")
    plt.xlabel("Time [s]")
    plt.ylabel("Amplitude")

    #Heaviside step function
    plt.figure(2)
    plt.plot(time,hvs_step_fcn(time))
    plt.grid()
    plt.title("Heaviside step function")
    plt.xlabel("Time [s]")
    plt.ylabel("Amplitude")
    
    #Two signals composition
    plt.figure(3)
    plt.plot(time,y_comp)
    plt.grid()
    plt.title("Composition of two signals")
    plt.xlabel("Time [s]")
    plt.ylabel("Amplitude")
        
    #Original, even, odd signals
    plt.figure(4)
    plt.subplot(3,1,1)
    plt.plot(time,y_comp)
    plt.grid()
    plt.title("Original, even, odd signals")
    plt.xlabel("Time [s]")
    plt.ylabel("Amplitude")
    plt.subplot(3,1,2)
    plt.plot(time,xe)
    plt.xlabel("Time [s]")
    plt.ylabel("Amplitude")
    plt.grid()
    plt.subplot(3,1,3)
    plt.plot(time,xo)
    plt.grid()
    plt.xlabel("Time [s]")
    plt.ylabel("Amplitude")
    