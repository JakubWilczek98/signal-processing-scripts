import numpy as np
import matplotlib.pyplot as plt

def prostokatny_bipolarny(A, time, freq, elements):
    omega = 2*np.pi*freq
    
    interwals = np.arange(1,2*elements+1,2)
    
    signal = 0
    for i in range(len(interwals)):
        signal = signal + 1/(interwals[i])*np.sin((interwals[i])*omega*time)
        
    signal = ((4*A)/np.pi)*signal

    return signal

def prostokatny_unipolarny_1(A, time, freq ,elements): #Prostokatny unipolarny z wypelnieniem 1/2
    omega = 2*np.pi*freq
    interwals = np.arange(3,2*elements-1,2)  
    
    sign = -1
    signal = np.cos(omega*time)
    for i in range(len(interwals)):
        signal = signal + sign*(1/(interwals[i])*np.cos(interwals[i]*omega*time))
        sign = sign * -1
    
    signal = A/2+(2*A)/np.pi*signal
    
    return signal

def prostokatny_unipolarny_2(A, time, freq, elements): #Prostokatny unipolarny wypelnienie dowolne
    omega = 2*np.pi*freq
    T = 1/freq #okres
    tau = 0.5 #wypelnienie
    signal = 0
    for i in range(elements-1):
        i = i +1
        signal = signal + (np.sin(i*np.pi*tau/T))/(np.pi*i*tau/T)*np.cos(i*omega*time)
    
    signal = (A*tau)/T + (2*A*tau)/T*signal
    
    return signal




if __name__ == "__main__":
    A = 0.5
    f = 1
    fs = 10000
    start_time = 0
    end_time = 3
    step_time = 1/fs
    elements = 10000
    
    time = np.arange(start_time, end_time, step_time)
    
    #prostokatny bipolarny
    prostokatny_bipolarny = prostokatny_bipolarny(A, time, f, elements)
    plt.plot(time, prostokatny_bipolarny)
    plt.show()
    
    #Prostokatny unipolarny z wypelnieniem 1/2
    prostokatny_unipolarny_1 = prostokatny_unipolarny_1(A, time, f, elements)
    plt.plot(time, prostokatny_unipolarny_1)
    plt.show()
    
    #Prostokatny unipolarny z wypelnieniem dowolonym
    prostokatny_unipolarny_2 = prostokatny_unipolarny_2(A, time, f, elements)
    plt.plot(time, prostokatny_unipolarny_2)
    plt.show()