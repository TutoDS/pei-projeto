module namespace page = 'http://basex.org/examples/web-page';

declare %updating
   %rest:path("/shop/post/json")
   %rest:POST("{$body}")

   function page:postRequest($body) {

    let $json := json:parse($body)
    let $xml :=
      <shop:shop xmlns:shop='http://www.shop-compare.pt/shop'>
        { $json//name }
        { $json//url }
        { $json//logo }
        <products>
          {
            for $prod in $json//products/_
            return <product>
              { $prod/productID }
              { $prod/title }
              { $prod/description }
              { $prod/link }
              { $prod/brand }
              { $prod/image }
              { $prod/graph }

               <history>
                  {
                    for $history in $prod/history/_
                    return <price_history>
                      { $history/dateTime  }
                      { $history/price  }
                    </price_history>
                  }
                </history>
            </product>
          }
        </products>
      </shop:shop>

   (: Write File :)
   let $path := string-join(["Documents/pei-project/basex/webapp/", $xml//name/text(), ".xml"])
   return file:write($path, $xml),

   (: validate xml with xsd :)
   let $xmlName := json:parse($body)//name/text()
   let $xmlPath := doc(string-join([$xmlName, ".xml"]))
   let $schema := doc("xsd/Main.xsd")
   return validate:xsd($xmlPath, $schema),

   (: Create Database :)
   let $name := json:parse($body)//name/text()
   let $path := string-join(["Documents/pei-project/basex/webapp/", $name, ".xml"])
   return db:create($name, $path, "./"),

   update:output("O seu pedido foi realizado com sucesso!")

};