## XML course

#### Que significa XML?
	eXtensible Markup Language (XML): nace como una extension de HTML, cuya mayor caracteristica es quye esta enfocado al procesamiento de datos.

#### Link: https://www.w3.org/XML/

#### Nota:
	Un archivo XML se le llama documento.
	Todos los documentos tienen una raiz.
	Todos los atributos deben ir entre comillas "attribute_name"

### Elementos de un documentos
	1.- Elementos o nodos.
	2.- Atributos.
	3.- Comentarios.
	4.- Characters Data Section.

#### Declaracion XML
##### Caracteristicas:
	* Es opcional.
	* La W3C recomienda tenerla.
	* Debe ser la primera linea del documentos.
	* Version.
	* Encoding.
	* standalone.
##### Ejemplo:
		<?xml version="1.0" encoding="UTF-8" standalone="yes"?>

#### Nodos o elementos.
##### Caracteristicas:
	* Iniciar con guion bajo o letra.
	* Esta permitido usar: letras, numeros, guiones o guiones bajos, puntos.
	* No se puede usar la cadena "xml" al nombrar un elemento.
	* No funny-characters.
##### Tipos:
	* Raiz: El nodo raiz o nodo documento.
	* Elemento: element node.
	* Atributo: attribute node.
	* Texto: text node.
	* Espacio de nombres: namespaces node.
##### Ejemplo:
	<__element>
		contenido_del_elemento_o_nodo
	</element>

#### Atributos.
##### Caracteristicas:
	* Iniciar con guion bajo o letra.
	* Esta permitido usar: letras, numeros, guiones o guiones bajos, puntos.
	* No se puede usar la cadena "xml" al nombrar un elemento.
	* No funny-characters.
##### Ejemplo:
	<__element data="empty">

#### Comentarios.
##### Caracteristicas:
	* No se pueden anidar comentarios.
	* Los comentarios van despues de la etiqueta de declaracion xml.
##### Sintaxis:
		<!-- comentario-->
##### Ejemplo:
		<!-- Ejemplo generico de xml -->

#### Character Data section.
##### Caracteristicas:
	* Permite escribir codigo libre.
	* No se puede anidar CDATA dentro de otro CDATA.
##### Sintaxis:
	<![CDATA[texto_libre]]>
##### Ejemplo: 
	<![CDATA[Este texto no se va a interpretar]]>

#### Processing Instruction:
##### Caracteristicas:
	* Son instrucciones que solo le interesan a la aplicacion que procesa el archivo XML, no al analizador de XML.
	* EL nombre del target no puede ser XML y tiene las mismas reglas del nombre que los nodos y atributos.
##### Sintaxis:
	<?target_instruction?>
##### Ejemplo:
	<?xml-stylesheet type="txt/xsl" href="style.xsl"?>

#### Entities:
##### Caracteristicas:
	* Son caracteres especiales.
	* Tambien pdoemos tener entidades perosnalizadas.
##### Ejemplo:
	<!DOCTYPE ed_oveja [<!ENTITY ed_oveja ">Oveja negra">]>
	&ed_oveja;

#### XML namespaces:
##### Caracteristicas:
	* Se utiliza como xlmns y aparece en las primeras instrucciones.
	* Tiene una especie de URL.
	* Preveen conflictos entre etiquetas con el mismo nombre, pero diferente significado.