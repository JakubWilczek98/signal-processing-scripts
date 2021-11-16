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

def trojkatny_bipolarny_1(A, time, freq ,elements):
    omega = 2 * np.pi * freq
    interwals = np.arange(3, 2 * elements - 1, 2)

    sign = -1
    signal = np.sin(omega * time)
    for i in range(len(interwals)):
        signal = signal + sign * (1 / (interwals[i])**2 * np.sin(interwals[i] * omega * time))
        sign = sign * -1

    signal = (8*A)/np.pi**2 * signal

    return signal

def trojkatny_bipolarny_2(A, time, freq ,elements):
    omega = 2 * np.pi * freq
    interwals = np.arange(2, elements - 1, 1)

    sign = -1
    signal = np.sin(omega * time)
    for i in range(len(interwals)):
        signal = signal + sign * (1 / (interwals[i]) * np.sin(interwals[i] * omega * time))
        sign = sign * -1

    signal = (2*A)/np.pi * signal

    return signal

def trojkatny_unipolarny_1(A, time, freq ,elements):
    omega = 2 * np.pi * freq
    signal = 0
    for i in range(elements):
        signal = signal + (1/(2*i+1)**2)*np.cos((2*i+1)*omega*time)

    signal = A/2-(4*A)/np.pi**2 * signal

    return signal

def trojkatny_unipolarny_2(A, time, freq ,elements):
    omega = 2 * np.pi * freq
    signal = 0
    for i in range(elements):
        i += 1
        signal = signal + (np.sin(i*omega*time)/i)

    signal = A/2-(A)/np.pi * signal

    return signal

def sinusoidalny_wyprostowany_dwupolowkowo(A, time, freq ,elements):
    omega = 2 * np.pi * freq
    signal = 0
    for i in range(elements):
        i += 1
        signal = signal + 1/(4*i**2-1)*np.cos(2*i*omega*time)

    signal = (2*A)/np.pi-(4*A)/np.pi * signal

    return signal

def sinusoidalny_wyprostowany_jednopolowkowo(A, time, freq ,elements):
    omega = 2 * np.pi * freq
    signal = 0
    for i in range(elements):
        i += 1
        signal = signal + 1/(4*i**2-1)*np.cos(2*i*omega*time)

    signal = A/np.pi+A/2*np.sin(omega*time)-(2*A)/np.pi * signal

    return signal





if __name__ == "__main__":
    A = 0.5
    f = 1
    fs = 50
    start_time = 0
    end_time = 3
    step_time = 1/fs
    elements = 10000
    
    time = np.arange(start_time, end_time, step_time)
    
    #prostokatny bipolarny
    prostokatny_bipolarny = prostokatny_bipolarny(A, time, f, elements)
    plt.figure(1)
    plt.plot(time, prostokatny_bipolarny)
    plt.show()
    
    #Prostokatny unipolarny z wypelnieniem 1/2
    prostokatny_unipolarny_1 = prostokatny_unipolarny_1(A, time, f, elements)
    plt.figure(2)
    plt.plot(time, prostokatny_unipolarny_1)
    plt.show()
    
    #Prostokatny unipolarny z wypelnieniem dowolonym
    plt.figure(3)
    prostokatny_unipolarny_2 = prostokatny_unipolarny_2(A, time, f, elements)
    plt.plot(time, prostokatny_unipolarny_2)
    plt.show()

    #Trojkatny bipolarny 1
    trojkatny_bipolarny_1 = trojkatny_bipolarny_1(A, time, f, elements)
    plt.figure(4)
    plt.plot(time, trojkatny_bipolarny_1)
    plt.show()

    #Trojkatny bipolarny 2
    trojkatny_bipolarny_2 = trojkatny_bipolarny_2(A, time, f, elements)
    plt.figure(5)
    plt.plot(time, trojkatny_bipolarny_2)
    plt.show()

    #Trojkatny unipolarny 1
    trojkatny_unipolarny_1 = trojkatny_unipolarny_1(A, time, f, elements)
    plt.figure(6)
    plt.plot(time, trojkatny_unipolarny_1)
    plt.show()

    #Trojkatny unipolarny 2
    trojkatny_unipolarny_2 = trojkatny_unipolarny_2(A, time, f, elements)
    plt.figure(7)
    plt.plot(time, trojkatny_unipolarny_2)
    plt.show()

    #Sinusoidalny wyprostowany dwupolowkowo
    sinusoidalny_wyprostowany_dwupolowkowo = sinusoidalny_wyprostowany_dwupolowkowo(A, time, f, elements)
    plt.figure(8)
    plt.plot(time, sinusoidalny_wyprostowany_dwupolowkowo)
    plt.show()

    # Sinusoidalny wyprostowany jednopolowkowo
    sinusoidalny_wyprostowany_jednopolowkowo = sinusoidalny_wyprostowany_jednopolowkowo(A, time, f, elements)
    plt.figure(9)
    plt.plot(time, sinusoidalny_wyprostowany_jednopolowkowo)
    plt.show()