async function loadAndTransform() 
{
    try {
        // 1. Cargar el XML
        const xmlResponse = await fetch('menu.xml');
        if (!xmlResponse.ok) {
            throw new Error(`Error al cargar XML: ${xmlResponse.statusText}`);
        }
        const xmlDoc = await xmlResponse.text();

        // 2. Cargar el XSL (asegúrate de que tu XSL use el prefijo 'm' para el namespace)
        const xslResponse = await fetch('transformar.xsl');
        if (!xslResponse.ok) {
            throw new Error(`Error al cargar XSL: ${xslResponse.statusText}`);
        }
        const xslDoc = await xslResponse.text();

        // Crear objetos DOM a partir de los textos
        const parser = new DOMParser();
        const xmlDom = parser.parseFromString(xmlDoc, 'application/xml');
        const xslDom = parser.parseFromString(xslDoc, 'application/xml');

        // 3. Crear el procesador XSLT
        const xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xslDom);

        // 4. Realizar la transformación
        // transformToFragment devuelve un DocumentFragment, que es ideal para inyectar en el DOM
        const resultDocument = xsltProcessor.transformToFragment(xmlDom, document);

        // 5. Inyectar el resultado en el HTML
        const contentDiv = document.getElementById('content');
        if (contentDiv) { // Asegúrate de que el div exista antes de intentar manipularlo
            contentDiv.innerHTML = ''; // Limpia el mensaje de carga
            contentDiv.appendChild(resultDocument);
        } else {
            console.error('Error: El elemento con ID "content" no se encontró.');
        }

    } catch (error) {
        console.error('Error durante la transformación:', error);
        const contentDiv = document.getElementById('content');
        if (contentDiv) {
            contentDiv.innerHTML = `
                <p style="color: red;">No se pudo cargar el menú. Por favor, inténtalo de nuevo más tarde.</p>
                <p style="color: red;">Detalles del error: ${error.message}</p>
            `;
        }
    }
}

// Ejecutar la función cuando el DOM esté completamente cargado.
// Esto asegura que el div 'content' ya exista en la página.
document.getElementById("demo").innerHTML = "Cambiado";
document.addEventListener('DOMContentLoaded', loadAndTransform);