Este directorio contendrá varios ficheros con información obtenida durante el proceso de compilación.

Entre otras cosas, tendremos el changelog, versión, url de la build, etc, ...

El formato de los ficheros será algo parecido a: webservice-2.5.4-B53.cfg

Este fichero deberá ser ejecutable porque se ejecutará y se cargarán las variables definidas, quedarán disponibles como variables de entorno.

Se ubicará en el directorio {{ dir_work }}/yaml-maker/yamls-cfg-files. Donde dir_work suele ser: /var/opt/xebialabs