function get(url, mode='xml') {
 return new Promise(function (resolve, reject) {
   const xhr = new XMLHttpRequest();
   xhr.open('GET', url);
   xhr.onload = _ => resolve(
     (mode === 'xml') ? xhr.responseXML : xhr.responseText
   );
   xhr.send();
 });
}

/*
 OpenWeatherMap API Keys
 1) 9cd4ed2efdb62088151c9aed6e319657
 2) 7e2ba55741f02b763cfaf7adc7dfacc5
 3) dc9847c95df0905b0e859c8ed7a5707f
*/

async function loadDoc(){
    const xml = await get("http://api.openweathermap.org/data/2.5/forecast?q=Paris,fr&mode=xml&APPID=9cd4ed2efdb62088151c9aed6e319657&lang=fr&units=metric", mode='xml')
    const xsl = await get( "/xml/weather.xsl", mode='xml')
    let xsltProcessor = new XSLTProcessor();
    xsltProcessor.importStylesheet(xsl);
    let resultDocument = xsltProcessor.transformToFragment(xml, document);   
     
    document.getElementById("demo").appendChild(resultDocument);
}

loadDoc()

