<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <title><s:message code="informeProveedorDetalle.ver.label" /></title>
    </head>
    <body>
        <jsp:include page="../menu.jsp" >
            <jsp:param name="menu" value="informeProveedorDetalle" />
        </jsp:include>

        <div id="ver-colegio" class="content scaffold-list" role="main">
            <h1><s:message code="informeProveedorDetalle.ver.label" /></h1>

            <p class="well">
                <sec:authorize access="!hasRole('ROLE_PRV')">
                    <a class="btn btn-primary" href="<s:url value='/factura/informeProveedorDetalle/revisar'/>"><i class="icon-list icon-white"></i> <s:message code='informeProveedorDetalle.lista.label' /></a>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_PRV')">
                    <a class="btn btn-primary" href="<s:url value='/factura/informeProveedorDetalle'/>"><i class="icon-list icon-white"></i> <s:message code='informeProveedorDetalle.lista.label' /></a>
                    <a class="btn btn-primary" href="<s:url value='/factura/informeProveedorDetalle/nueva'/>"><i class="icon-user icon-white"></i> <s:message code='informeProveedorDetalle.nuevo.label' /></a>
                </sec:authorize>
            </p>
            <c:if test="${not empty message}">
                <div class="alert alert-block alert-success fade in" role="status">
                    <a class="close" data-dismiss="alert">×</a>
                    <s:message code="${message}" arguments="${messageAttrs}" />
                </div>
            </c:if>


            <form:errors path="*" cssClass="alert alert-error" element="ul" />
            <div class="row-fluid" style="padding-bottom: 10px;">
                <div class="span1"><s:message code="folio.label" /></div>
                <div class="span11">${informeProveedorDetalle.folioFactura}</div>
            </div>
            <div class="row-fluid" style="padding-bottom: 10px;">
                <div class="span1"><s:message code="proveedor.label" /></div>
                <div class="span11">${informeProveedorDetalle.nombreProveedor}</div>
            </div>
            <div class="row-fluid" style="padding-bottom: 10px;">
                <div class="span1"><s:message code="rfc.label" /></div>
                <div class="span11">${informeProveedorDetalle.RFCProveedor}</div>
            </div>
            <div class="row-fluid" style="padding-bottom: 10px;">
                <div class="span1"><s:message code="iva.label" /></div>
                <div class="span11">${informeProveedorDetalle.IVA}</div>
            </div>
            <div class="row-fluid" style="padding-bottom: 10px;">
                <div class="span1"><s:message code="subtotal.label" /></div>
                <div class="span11">${informeProveedorDetalle.subtotal}</div>
            </div>
            <div class="row-fluid" style="padding-bottom: 10px;">
                <div class="span1"><s:message code="total.label" /></div>
                <div class="span11">${informeProveedorDetalle.total}</div>
            </div>
            <div class="row-fluid" style="padding-bottom: 10px;">
                <div class="span1"><s:message code="total.label" /></div>
                <div class="span11">${informeProveedorDetalle.dctoProntoPago}</div>
            </div>
            <div class="row-fluid" style="padding-bottom: 10px;">
                <div class="span1"><s:message code="status.label" /></div>
                <div class="span11">${informeProveedorDetalle.status}</div>
            </div>
            <div class="row-fluid" style="padding-bottom: 10px;">
                <div class="span1"><s:message code="fechaFactura.label" /></div>
                <div class="span11">${informeProveedorDetalle.fechaFactura}</div>
            </div>
            <div class="row-fluid" style="padding-bottom: 10px;">
                <div class="span1"><s:message code="informeEmpleado.label" /></div>
                <div class="span11">${informeProveedorDetalle.informeProveedor.id}</div>
            </div>

            <ul class="thumbnails">
                <li class="span2">
                    <div class="thumbnail" >
                        <c:if test="${informeProveedorDetalle.pathXMl!= null && !informeProveedorDetalle.pathXMl.isEmpty()}">
                            <a  href="<s:url value='/factura/informeProveedorDetalle/downloadXmlFile/${informeProveedorDetalle.id}'/>"><img src="<c:url value='/images/xml.png'/>" width="120" height="100" /></a>
                            </c:if>
                            <c:if test="${informeProveedorDetalle.pathXMl== null || informeProveedorDetalle.pathXMl.isEmpty()}"><img src="<c:url value='/images/vista/Error.png'/>" width="120" height="100" /></c:if>
                            <div class="caption">
                                <p><a class="btn btn-primary" href="<s:url value='/factura/informeProveedorDetalle/updateXMLFile'/>"><i class="fa fa-refresh"></i> <s:message code='cambiarArchivoXML.edita' /></a></p>
                        </div>
                    </div>
                </li>
                <li class="span2">

                    <div class="thumbnail">

                        <c:if test="${informeProveedorDetalle.pathPDF!= null && !informeProveedorDetalle.pathPDF.isEmpty()}">
                            <a  href="<s:url value='/factura/informeProveedorDetalle/downloadPdfFile/${informeProveedorDetalle.id}'/>"><img src="<c:url value='/images/pdf.png'/>" width="120" height="100" /></a>
                            </c:if>
                            <c:if test="${informeProveedorDetalle.pathPDF== null || informeProveedorDetalle.pathPDF.isEmpty()}"><img src="<c:url value='/images/vista/Error.png'/>" width="120" height="100" /></c:if>

                            <div class="caption">
                                <p> <a class="btn btn-primary" href="<s:url value='/factura/informeProveedorDetalle/updatePDFFile'/>"><i class="fa fa-refresh"></i> <s:message code='cambiarArchivoPDF.edita' /></a></p>
                        </div>
                    </div>
                </li>
            </ul>



            <c:url var="eliminaUrl" value="/factura/informeProveedorDetalle/elimina" />
            <form:form commandName="informeProveedorDetalle" action="${eliminaUrl}" >    
                <c:if test="${informeProveedorDetalle.informeProveedor.status=='A'}">
                    <p class="well">
                        <form:hidden path="id" />
                        <button type="submit" name="eliminaBtn" class="btn btn-danger btn-large" id="eliminar"  onclick="return confirm('<s:message code="confirma.elimina.message" />');" ><i class="icon-trash icon-white"></i>&nbsp;<s:message code='eliminar.button'/></button>
                    </p>
                </c:if>
            </form:form>
            <c:url var="eliminaValidaUrl" value="/factura/informeProveedorDetalle/eliminaValida" />
            <form:form commandName="informeProveedorDetalle" action="${eliminaValidaUrl}" >    
                <sec:authorize access="hasRole('ROLE_PRV_VALIDA')">
                    <p class="well">

                        <form:hidden path="id" />
                        <button type="submit" name="eliminaBtn" class="btn btn-danger btn-large" id="eliminar"  onclick="return confirm('<s:message code="confirma.elimina.message" />');" ><i class="icon-trash icon-white"></i>&nbsp;<s:message code='eliminar.button'/></button>
                    </p>
                </sec:authorize>
            </form:form>
        </div>
    </body>
</html>

