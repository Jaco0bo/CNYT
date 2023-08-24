# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

import math
def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.

def suma_comp(c1,c2):
    """suma 2 numeros complejos
    (comp,comp) -> (int,comp)
    """
    parte_r = c1[0]+c2[0]
    parte_i = c1[1]+c2[1]
    a = round(parte_r, 2)
    b = round(parte_i, 2)
    return a, b

def mult_comp(c1,c2):
    """multiplica 2 numeros complejos
    (comp,comp) -> (int,comp)
    """
    parte_r = (c1[0] * c2[0]) - (c1[1] * c2[1])
    parte_i = (c1[0] * c2[1]) + (c2[0] * c1[1])
    a = round(parte_r, 2)
    b = round(parte_i, 2)
    return a, b

def div_comp(c1,c2):
    """hace la division de dos numeros complejos
    (comp,comp) -> (int,comp)
    """
    parte_r = (((c1[0] * c2[0]) + (c1[1] * c2[1])) / ((c2[0])**2+(c2[1])**2))
    parte_i = (((c2[0] * c1[1]) - (c1[0] * c2[1])) / ((c2[0])**2+(c2[1])**2))
    a = round(parte_r, 2)
    b = round(parte_i, 2)

    return a, b

def mod_comp(c1):
    """saca el modulo de un numero complejo
    (comp) -> float
    """
    resp = math.fabs(math.sqrt((c1[0])**2+(c1[1])**2))
    a = round(resp, 2)

    return a

def conj_comp(c1):
    """devuelve el conjugado de un numero complejo
    (comp) -> int,comp
    """
    parte_r = c1[0]
    parte_i = -c1[1]
    return parte_r, parte_i

def convcp_comp(c1):
    """convierte un numero complejo de coordenadas
    cartesianas a polares
    (comp) -> (float,float)
    """
    resp = math.atan2(c1[1],c1[0])
    angulo = resp * 180 / math.pi
    angulo_r = round(angulo,2)
    a = math.sqrt(c1[0]**2+c1[1]**2)
    r = round(a, 2)

    return r, angulo_r

def convpc_comp(c1):
    """convierte un numero complejo de coordenadas
    polares a cartesianas
    (comp) -> (float,float)
    """
    m = math.radians(c1[1])
    a = c1[0] * math.cos(m)
    b = c1[0] * math.sin(m)
    x = round(a, 2)
    y = round(b, 2)

    return x, y

def fase_comp(c1):
    """Devuelve la fase de un numero complejo
    (comp) -> float
    """
    resp = math.atan2(c1[1], c1[0])
    angulo = resp * 180 / math.pi
    angulo_r = round(angulo, 2)
    if angulo_r < 0:
        angulo_r += 360

    return angulo_r

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')
    print(suma_comp((2, 3.3), (9, -4.6)))
    print(mult_comp((3, 2), (-5, 5.2)))
    print(div_comp((3, 2), (-5, 5.2)))
    print(mod_comp([3, 2]))
    print(conj_comp([3, 2]))
    print(convcp_comp([4, 3]))
    print(convpc_comp([5, 36.87]))
    print(fase_comp([4, 3]))



# See PyCharm help at https://www.jetbrains.com/help/pycharm/
