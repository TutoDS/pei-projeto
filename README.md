# Projeto de PEI

## Todos os detalhes sbore o projeto estão detalhadamente apresentados na **Wiki**.

## Trabalhos futuros
+ [ ] Melhorar toda a parte de *Scraping*, bem como o armazenamento dos preços, garantindo que não existem preços com diferença de apenas segundos;
+ [ ] Documentar em maior detalhe todo o código desenvolvido


### **Objetivo:** 
Criar um lista de smartphones da Worten e da FNAC, bem como registar o histórico de preços de cada produto.

### **Software Utilizado:**
<a href="https://www.postman.com" style="margin-right: 10px">
<img src="https://img.shields.io/badge/POSTMAN-✓-orange" alt="Postman">
</a>
<a href="http://basex.org" style="margin-right: 10px">
<img src="https://img.shields.io/badge/BaseX-✓-red" alt="BaseX">
</a>
<a href="https://www.oxygenxml.com" style="margin-right: 10px">
<img src="https://img.shields.io/badge/Oxygen%20XML%20Editor-✓-blue" alt="Oxygen XML Editor">
</a>
<a href="https://code.visualstudio.com" style="margin-right: 10px">
<img src="https://img.shields.io/badge/Visual%20Studio%20Code-✓-blue" alt="VSCode">
</a>

#### **Plugins recomendados VSCode:**
+ XML Tools
+ XML Language Support
+ XML Format
+ XML Complete

 
### **Recolha dos dados / Scrpping**
<a href="https://www.postman.com" style="margin-right: 10px">
<img src="https://img.shields.io/badge/POSTMAN-✓-orange" alt="Postman">
</a>
<a href="https://cheerio.js.org" style="margin-right: 10px">
<img src="https://img.shields.io/badge/Cheerio-✓-orange" alt="Cheerio">
</a>

Através do **Postman** e com o uso do **Cheerio** foi realizado determinado código de acordo com o site da loja **FNAC** ou **Worten**

#### Testar código utilizado para a recolha dos dados
Para testar todo o código (utilizando o **Cheerio**) é necessário importar o ficheiro `collection.json` (disponível na raiz do projeto) no **Postman**.
Após importar irá contar com vários pedidos (todos eles para a realização deste projeto e explicados na [**wiki**](https://gitlab.com/jdaniel.asousa/pei-project/-/wikis/home)). Os pedidos com o nome `FNAC - Price History` e `WORTEN - Price History` são os pedidos utilizados para obter os dados dos produtos e respetivos preços.

### Conversão para XML
Após a recolha dos dados, estes ficam armazenados numa *environment variable* no **Postman** no format **JSON**, sendo necessário converter para **XML**. Para tal foi criado um *endpoint* no **BaseX** que recebe este **JSON**, criando de seguida o ficheiro **XML** com o respetivo conteúdo.