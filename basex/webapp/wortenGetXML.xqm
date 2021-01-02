module namespace page = 'http://basex.org/examples/web-page';

declare 
  %rest:GET 
  %rest:path("/worten/xml")
    function page:getWorten() {
      doc("Worten.xml")
    };