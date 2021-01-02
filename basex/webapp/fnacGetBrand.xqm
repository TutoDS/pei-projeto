module namespace page = 'http://basex.org/examples/web-page';

declare 
  %rest:GET 
  %output:media-type("text/html")
  %rest:path("/fnac/{ $brand }")
    function page:getFnac($brand) {
        let $in := doc("fnac.pt.xml")
        let $style := doc("xslt/fnacBrand.xsl")
        return xslt:transform-text($in, $style, map {'paramBrand': $brand})
    };