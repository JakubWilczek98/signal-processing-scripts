import numpy as np
import matplotlib.pyplot as plt

def impuls_prostokatny(time, od, do):
    y = np.zeros(len(time))
    for i in range(len(time)):
        if time[i] < od:
            y[i] = 0
        elif time[i] >= od and time[i] < do:
            y[i] = 1
        else:
            y[i] = 0
    return(y)


if __name__ == "__main__":
    #Czas
    time = np.arange(0,10,0.001)    
    #Signals     
    y_exp = np.exp(-time) 
    y = impuls_prostokatny(time, 1, 4)
    
    #Zlozenie
    y_zl = y*y_exp
        
    
    fig, axs = plt.subplots(3, 1, constrained_layout=True)
    fig.suptitle('Charts', fontsize=16)
    axs[0].plot(time, y)
    axs[0].set_xlabel("Time [s]")
    axs[0].set_ylabel("Amplitude")
    axs[0].grid()
    
    axs[1].plot(time, y_exp)
    axs[1].set_xlabel("Time [s]")
    axs[1].set_ylabel("Amplitude")
    axs[1].grid()
    
    axs[2].plot(time, y_zl)
    axs[2].set_xlabel("Time [s]")
    axs[2].set_ylabel("Amplitude")
    axs[2].grid()
    plt.show()

