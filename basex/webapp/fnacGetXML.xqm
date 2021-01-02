module namespace page = 'http://basex.org/examples/web-page';

declare 
  %rest:GET 
  %rest:path("/fnac/xml")
    function page:getFnac() {
      doc("fnac.pt.xml")
    };