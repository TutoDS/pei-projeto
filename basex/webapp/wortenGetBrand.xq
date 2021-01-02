module namespace page = 'http://basex.org/examples/web-page';

declare 
  %rest:GET 
  %output:media-type("text/html")
  %rest:path("/worten/{ $brand }")
    function page:getWorten($brand) {
        let $in := doc("Worten.xml")
        let $style := doc("xslt/wortenBrand.xsl")
        return xslt:transform-text($in, $style, map {'paramBrand': $brand})
    };