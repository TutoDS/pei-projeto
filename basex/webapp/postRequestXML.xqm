module namespace page = 'http://basex.org/examples/web-page';

declare %updating
   %rest:path("/shop/post/xml")
   %rest:POST("{$body}")

   function page:postxml($body) {

   (: validate xml with xsd :)
   let $xmlName := $body//name/text()
   let $xmlPath := $body
   let $schema := doc("./xsd/Main.xsd")
   return validate:xsd(
    $xmlPath, $schema
  ),

   file:write(
    string-join(
      ["Documents/pei-project/basex/webapp/",$body/shop/name/text(), ".xml"]
    ), $body
  ),

   db:create(
    $body/shop/name/text() , string-join(
      ["Documents/pei-project/basex/webapp/", $body/shop/name/text(), ".xml"]
    ), "./"
  ),


  update:output(
    "Successful!"
  )

};