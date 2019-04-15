+++
title = "Introducción a React Js"
date = 2019-04-09T21:32:07-05:00
categories = [ "Programming", "React" ]
draft = true
+++


## ¿Qué es?
- Biblioteca para construir interfaces web
- Es la vista en MVC
- Sigle Page Application
- Sólo se encarga de la interfaz


## ¿Por qué?
Hacer más fácil la creación de interfaces web usando javascript

## Ventajas
- Miestras escribes código podrás ver tus cambios
- Utiliza virtual Dom para refrescar la parte en la memoria que cambio
- Tiene/utiliza componentes

## Componentes
- API reusable
- Crea etiquetas HTML para reutilizar
- Reusable
- HTML, CSS, Javascript

## Instalación
1. Instalar node.js
2. Generador de proyectos

* ```$ npm install -g create-react-app```



3. Creación de la aplicación react

* ```$ create-reat-app my-app```

4. Entrar a la carpeta del proyecto

* `$ cd my-app`

5. Levantar el proyecto

* `$ npm start`


En el punto número cuatro al entrar a la carpeta del proyecto, aparecerá la siguiente estructura de archivos:

<img src="http://aux.iconspalace.com/uploads/folder-icon-256-1787672482.png" alt="Example" width="25" height="23"/>  my-app

<table>
  <tr>
    <th></th>
    <th>Descripción </th>
  </tr>
  <tr>
    <td>README.md</th>
    <td> Documentación del proyecto</th>
  </tr>
  <tr>
    <td>package.json</th>
    <td>Archivo que contiene el nombre, la version, dependencias del proyecto, etc.</th>
  </tr>
    <tr>
    <td>package.lock.json</th>
    <td>Archivo generado para guardar las versiones del proyecto, este archivo no se toca</th>
  </tr>
    <tr>
    <td>.gitignore</th>
    <td>Para la utilización de git</th>
  </tr>
    <tr>
    <td><img src="http://aux.iconspalace.com/uploads/folder-icon-256-1787672482.png" alt="Example" width="21" height="17"/> node_modules</th>
    <td>Se instalan los entornos js que se utilizarán para el proyecto</th>
  </tr>
    <tr>
    <td><img src="http://aux.iconspalace.com/uploads/folder-icon-256-1787672482.png" alt="Example" width="21" height="17"/> public</th>
    <td>Donde se colocan los archivos HTML</th>
  </tr>
  <tr>
    <td>---> index.html</th>
    <td>Archivo que contiene **div id="root"**, donde toda la aplicación de React se montará</th>
  </tr>
  <tr>
    <td><img src="http://aux.iconspalace.com/uploads/folder-icon-256-1787672482.png" alt="Example" width="21" height="17"/> src</th>
    <td>Donde estan guardados los archivos js y css</th>
  </tr>
    <tr>
    <td> --> index.j</th>
    <td>El archivo que arranca todo</th>
  </tr>
</table>
