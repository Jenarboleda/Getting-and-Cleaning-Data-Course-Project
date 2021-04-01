# Getting and Cleaning Data Project

información sobre las variables, datos y transformaciones utilizadas en Getting and Cleaning Data Project.

Fuente de datos: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Los experimentos se han realizado con un grupo de 30 voluntarios dentro de un grupo de edad de 19 a 48 años. Cada persona realizó seis actividades (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) con un teléfono inteligente (Samsung Galaxy S II) en la cintura. Usando su acelerómetro y giroscopio integrados, capturamos la aceleración lineal 3-axial y la velocidad angular 3-axial a una tasa constante de 50Hz. Los experimentos se han grabado en video para etiquetar los datos manualmente. El conjunto de datos obtenido se ha dividido aleatoriamente en dos conjuntos, donde se seleccionó al 70% de los voluntarios para generar los datos de entrenamiento y al 30% los datos de la prueba.

Las señales del sensor (acelerómetro y giroscopio) se preprocesaron aplicando filtros de ruido y luego se muestrearon en ventanas deslizantes de ancho fijo de 2,56 segundos y 50% de superposición (128 lecturas / ventana). La señal de aceleración del sensor, que tiene componentes gravitacionales y de movimiento corporal, se separó mediante un filtro de paso bajo Butterworth en aceleración corporal y gravedad. Se supone que la fuerza gravitacional tiene solo componentes de baja frecuencia, por lo que se utilizó un filtro con una frecuencia de corte de 0.3 Hz. De cada ventana, se obtuvo un vector de características calculando variables del dominio del tiempo y la frecuencia.
Información de atributos

Para cada registro del conjunto de datos se proporciona:

 - Aceleración triaxial del acelerómetro (aceleración total) y la aceleración corporal estimada.
 - Velocidad angular triaxial del giroscopio.
 - Un vector de 561 características con variables de dominio de tiempo y frecuencia.
 - Su etiqueta de actividad.
 - Un identificador del sujeto que realizó el experimento. 
