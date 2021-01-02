module namespace page = 'http://basex.org/examples/web-page';

declare 
  %rest:GET 
  %output:media-type("text/html")
  %rest:path("/worten")
    function page:getWorten() {
      (:xslt:transform("Worten.xml", "xslt/worten.xsl"):)
        let $in := doc("Worten.xml")
        let $style := doc("xslt/worten.xsl")
        return xslt:transform-text($in, $style)
    };