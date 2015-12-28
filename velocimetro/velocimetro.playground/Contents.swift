/* implementar una enumeración "Velocidades" con cuatro estados diferentes
Crea un playground que contenga los elementos para representar un velocímetro de un automóvil. Recuerda que estamos practicando la programación orientada a objetos y primero debes diseñar la clase, enumeraciones o estructuras para llevarlas a un aplicación móvil. ¿Qué debes de realizar?

Declara la enumeración: Velocidades, sus valores serán de tipo Int.
La enumeración Velocidades cuenta con los siguientes elementos y sus respectivos valores:
- Apagado = 0, representa la velocidad 0.

- VelocidadBaja = 20, representa una velocidad de 20km por hora.

- VelocidadMedia = 50, representa una velocidad de 50km por hora

- VelocidadAlta = 120, representa una velocidad de 50km por hora.

- Además, debes de declarar un inicializador que recibe un velocidad:

- init( velocidadInicial : Velocidades )

- El inicializador se debe asignar a self el valor de velocidadInicial

Declara la clase: Auto
La clase Auto tiene los siguientes atributos:
- Una variable que sea una instancia de la enumeración Velocidades, llamada: velocidad.

Las funciones o métodos que define la clase Auto son las siguientes:
- init( ), agrega la función inicializadora que crea una instancia de Velocidades: velocidad, debe iniciar en Apagado. Recuerda que la enumeración tiene su función inicializadora.

- func cambioDeVelocidad( ) -> ( actual : Int, velocidadEnCadena: String), la función cambioDeVelocidad, cambia el valor de velocidad a la siguiente velocidad gradual, por ejemplo:  Apagado cambia a VelocidadBaja, de VelocidadBaja cambia a VelocidadMedia, es decir cada ejecución cambia a la siguiente velocidad.. si llega a VelocidadAlta cambia a VelocidadMedia. Finalmente, la función debe regresar una tupla con la velocidad actual y una cadena con la leyenda de la velocidad correspondiente.

Pruebas de la clase:
- En el mismo playground prueba crea una instancia de la clase Auto, llamada auto.

- Itera 20 veces usando un for, llama a la función cambioDeVelocidad e imprime los valores de la tupla en la consola.

*/

import UIKit

//******************** SE DEFINE LA ENUMERACIÓN

enum Velocidades : Int{
    case Apagado = 0, velocidadBaja = 20, velocidadMedia = 50, velocidadAlta = 120
    
    //******************** INICIALIZADOR DE LA ENUMERACIÓN
    
    init(velocidadInicial : Velocidades ){
        self = velocidadInicial
    }
}

//******************** SE DEFINE LA CLASE AUTO
class Auto{
    var velocidad : Velocidades
    
    //******************** INICIALIZADOR DE LA CLASE INICIALIZANDO LAS VELOCIDADES EN APAGADO
    init(){
        velocidad = Velocidades(velocidadInicial: Velocidades.Apagado)
    }
    
    //******************** SE DEFINE LA FUNCION VELOCIDAD ACTUAL PARA DEVOLVER LA VELOCIDAD ACTUAL ANTES DE HACER EL CAMBIO A LA SIGUIENTE VELOCIDAD
    func velocidadActual() -> (actual : Int, velocidadEnCadena: String){
        return (velocidad.rawValue, String(velocidad))
    }
    
    //******************** IMPLEMENTA LAS REGLAS PARA ELEGIR LA SIGUIENTE VELOCIDAD Y DESPUES DEVUELVE LA VELOCIDAD A LA QUE SE CAMBIO
    func cambioDeVelocidad() -> (actual : Int, velocidadEnCadena: String){
        switch velocidad{
        case Velocidades.Apagado:
            velocidad = Velocidades.velocidadBaja
            break
        case Velocidades.velocidadBaja:
            velocidad = Velocidades.velocidadMedia
            break
        case Velocidades.velocidadMedia:
            velocidad = Velocidades.velocidadAlta
            break
        case Velocidades.velocidadAlta:
            velocidad = Velocidades.velocidadMedia
            break
        }
        return (velocidad.rawValue, String(velocidad))
    }
}

//******************** SE CREA UNA INSTANCIA DE LA CLASE AUTO
var auto : Auto = Auto()

//******************** SE OBTIENE LA VELOCIDAD ACTUAL ANTES DE HACER EL PRIMER CAMBIO Y SE MUESTRA
var tuplaVelocidadActual = auto.velocidadActual()
print("\(tuplaVelocidadActual.actual), \(tuplaVelocidadActual.velocidadEnCadena)")

//******************** SE ITERA 20 VECES REALIZANDO CAMBIOS DE VELOCIDAD Y MOSTRANDO EL ESTADO ACTUAL
for var iteracion = 0; iteracion < 20; iteracion++ {
    tuplaVelocidadActual = auto.cambioDeVelocidad()
    print("\(tuplaVelocidadActual.actual), \(tuplaVelocidadActual.velocidadEnCadena)")
}

