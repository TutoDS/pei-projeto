module namespace page = 'http://basex.org/examples/web-page';

declare 
  %rest:GET
  %output:media-type("text/html")
  %rest:path("/fnac")
    function page:getWorten() {
      (:xslt:transform("Worten.xml", "xslt/worten.xsl"):)
        let $in := doc("fnac.pt.xml")
        let $style := doc("xslt/fnac.xsl")
        return xslt:transform-text($in, $style)
    };