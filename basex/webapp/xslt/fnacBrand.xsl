<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="paramBrand" />
    <xsl:template match="/">
        <html>

        <head>
            <!-- Meta Tags -->
            <meta charset="UTF-8">
            </meta>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            </meta>


            <title>
                <xsl:value-of select="//name" /> - Lista de Smartphones
                <xsl:value-of select="$paramBrand" />
            </title>

            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
            </link>

            <link rel="stylesheet" href="style.css">
            </link>

            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
            </link>

        </head>

        <body>
            <header>

                <div class="navbar navbar-dark shadow-sm bg-dark">
                    <div class="container d-flex justify-content-between">
                        <a href="{//url}" class="navbar-brand d-flex align-items-center">
                            <img src="{//logo}" width="50px"></img>
                        </a>

                        <div class="text-right">
                            <a href="/" class="text-white mr-4">
                                Home
                            </a>

                            <a href="/worten" class="text-white mr-4">
                                Worten
                            </a>

                            <a href="/fnac" class="text-white font-weight-bold">
                                Fnac
                            </a>
                        </div>
                    </div>
                </div>
            </header>

            <section class="jumbotron text-center"
                style="background-position: center;background-image: url(https://images.pexels.com/photos/163143/sackcloth-sackcloth-textured-laptop-ipad-163143.jpeg); background-size: cover;">
                <div class="container pt-5 pb-5 text-white" style="background-color: rgba(55,55,55,0.75)">
                    <h3>Lista de Smartphones <span class="ml-1">
                            <xsl:value-of select="$paramBrand" /></span></h3>
                    <p class="lead">Aqui pode encontrar uma seleção de smartphones da loja
                        <b class="ml-1">
                            <xsl:value-of select="//name" /></b>, bem como o histórico de
                        preços para cada um.</p>
                </div>
            </section>

            <main role="main" class="mt-3 mb-3">
                <div class="container">
                    <div class="row">
                        <xsl:for-each select="//products/product">
                            <xsl:choose>
                                <xsl:when test="brand = $paramBrand">
                                    <div class="col-md-4 mt-2 mb-2">
                                        <div class="card">
                                            <img src="{image}" class="card-img-top border-bottom pb-3 pt-4" alt="{title}"></img>
                                            <div class="card-body pt-2 pb-2" style="height: 200px;">
                                                <h6 class="card-title">
                                                    <xsl:value-of select="title" />
                                                </h6>
                                                <div class="card-text mt-1 mb-1">
                                                    <span class="font-weight-bold mr-1">
                                                        <i class="fas fa-info-circle mr-1" /> Descrição: </span>
                                                    <xsl:value-of select="description" />
                                                </div>
                                                <div class="card-text mt-1 mb-1">
                                                    <span class="font-weight-bold mr-1">
                                                        <i class="fas fa-copyright mr-1" /> Marca:</span>
                                                    <a href="/fnac/{brand}">
                                                        <xsl:value-of select="brand" /></a>
                                                </div>
                                                <div class="card-text mt-1 mb-1">
                                                    <span class="font-weight-bold mr-1">
                                                        <i class="fas fa-money-bill-alt mr-1" /> Preço: </span>
                                                    <xsl:variable name="length">
                                                        <xsl:value-of select="count(history/price_history)" />
                                                    </xsl:variable>
                                                    <xsl:value-of select="history/price_history[$length + 0]/price" /> €
                                                    (<small>
                                                        <xsl:value-of select="history/price_history[$length + 0]/dateTime" />
                                                        </small>)
                                                </div>
                                            </div>
                                            <div class="card-footer d-inline-block text-center bg-dark">
                                                <xsl:variable name="url">
                                                    <xsl:value-of select="link" />
                                                </xsl:variable>
                                                <a href="{$url}" target="_blank" class="btn btn-info mr-2">Ver Produto</a>


                                                <xsl:variable name="id">
                                                    <xsl:value-of select="productID" />
                                                </xsl:variable>

                                                <a href="#view-history-{$id}" data-toggle="modal" class="btn btn-primary">Abrir
                                                    histórico</a>

                                                <!-- Modal -->
                                                <div class="modal fade" id="view-history-{$id}" tabindex="-1" role="dialog"
                                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header bg-dark text-white">
                                                                <h6 class="modal-title" id="exampleModalLabel">
                                                                    <xsl:value-of select="title" /> - Histórico de
                                                                    Preços</h6>
                                                                <button type="button" class="fs-12px close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                    <i class="fas fa-times-circle fs-12px text-white" />
                                                                </button>
                                                            </div>
                                                            <div class="modal-body text-center">
                                                            
                                                            <img width="400" height="300">
                                                                <xsl:attribute name = "src">
                                                                <xsl:value-of select="graph" />                                                    
                                                                </xsl:attribute>
                                                            </img>
                                                            <a href="{graph}" target="_blank" class="btn btn-info mr-2">Ver Gráfico</a>
                                                             <xsl:for-each select="history/price_history">
                                                                <xsl:sort select="price" data-type="number" order="ascending" /> 
                                                                 <xsl:if test="position()=1">
                                                                 <div class="card-text mt-4 mb-1 text-left">
                                                                 <span class="font-weight-bold mr-2">
                                                                 <i class="fa fa-minus-square mr-1" />Preço mínimo:</span>
                                                                 <xsl:value-of select="price"/>€
                                                                 (<small>
                                                                 <xsl:value-of select="dateTime"/>
                                                                 </small>)
                                                                 </div>
                                                                 </xsl:if>
                                                             </xsl:for-each>
                                                              <xsl:for-each select="history/price_history">
                                                                <xsl:sort select="price" data-type="number" order="descending" /> 
                                                                 <xsl:if test="position()=1">
                                                                 <div class="card-text mt-1 mb-1 text-left">
                                                                 <span class="font-weight-bold mr-2">
                                                                 <i class="fa fa-plus-square mr-1" />Preço máximo:</span>
                                                                 <xsl:value-of select="price"/>€
                                                                 (<small>
                                                                 <xsl:value-of select="dateTime"/>
                                                                 </small>)
                                                                 </div>
                                                                 </xsl:if>
                                                             </xsl:for-each>
                                                                 <div class="card-text mt-1 mb-3 text-left">
                                                                 <span class="font-weight-bold mr-2">
                                                                 <i class="fa fa-code mr-1" />Preço médio:</span>
                                                                      <xsl:value-of select="format-number(sum(history/price_history/price) div count(history/price_history/price),'#.##')"/>€                                                                 
                                                                 </div>  
                                                                 <span class="font-weight-bold">   
                                                                 Tabela de dados:
                                                                 </span> 
                                                                <table class="table">
                                                                    <thead>
                                                                        <tr class="text-center">
                                                                            <th>Preço</th>
                                                                            <th>Data</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <xsl:for-each select="history/price_history">
                                                                            <tr class="text-center">
                                                                                <td>
                                                                                    <xsl:value-of select="price" /> €
                                                                                </td>
                                                                                <td>
                                                                                    <xsl:value-of select="dateTime" />
                                                                                </td>
                                                                            </tr>
                                                                        </xsl:for-each>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                    </div>
                </div>
            </main>
            <footer class="text-white bg-dark">
                <div class="container pt-5 pb-5">
                    <p class="text-right"><b>Desenvolvido por:</b> João Coimbra e Daniel
                        Sousa</p>
                    <p class="text-right">Todos os direitos reservados.</p>
                </div>
            </footer>

            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous">
            </script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
            </script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
            </script>
        </body>

        </html>
    </xsl:template>
</xsl:stylesheet>
