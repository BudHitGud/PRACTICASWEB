<?php
// Cargar el archivo XML
$xmlDoc = new DOMDocument();
$xmlDoc->load("menu.xml");

// Cargar el archivo XSLT
$xslDoc = new DOMDocument();
$xslDoc->load("menu.xsl");

// Crear un procesador XSLT
$proc = new XSLTProcessor();
$proc->importStyleSheet($xslDoc);

// Realizar la transformación
$newXml = $proc->transformToXML($xmlDoc);

// Mostrar el resultado
echo $newXml;
?>