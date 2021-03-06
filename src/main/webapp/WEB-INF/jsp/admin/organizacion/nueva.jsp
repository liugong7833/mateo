<%-- 
    Document   : nuevo
    Created on : Jan 27, 2012, 10:37:52 AM
    Author     : jdmr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <title><s:message code="organizacion.nueva.label" /></title>
    </head>
    <body>
        <jsp:include page="../menu.jsp" >
            <jsp:param name="menu" value="organizacion" />
        </jsp:include>

        <div id="nueva-organizacion" class="content scaffold-list" role="main">
            <h1><s:message code="organizacion.nueva.label" /></h1>
            <p class="well">
                <a class="btn btn-primary" href="<s:url value='/admin/organizacion'/>"><i class="icon-list icon-white"></i> <s:message code='organizacion.lista.label' /></a>
            </p>
            <form:form commandName="organizacion" action="crea" method="post">
                <form:errors path="*">
                    <div class="alert alert-block alert-error fade in" role="status">
                        <a class="close" data-dismiss="alert">×</a>
                        <c:forEach items="${messages}" var="message">
                            <p>${message}</p>
                        </c:forEach>
                    </div>
                </form:errors>

                <fieldset>
                    <s:bind path="organizacion.codigo">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="codigo">
                                <s:message code="codigo.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:input path="codigo" maxlength="128" required="true" cssClass="span3" />
                            <form:errors path="codigo" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    <s:bind path="organizacion.nombre">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="nombre">
                                <s:message code="nombre.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:input path="nombre" maxlength="128" required="true" cssClass="span4" />
                            <form:errors path="nombre" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    <s:bind path="organizacion.nombreCompleto">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="nombreCompleto">
                                <s:message code="nombreCompleto.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:input path="nombreCompleto" maxlength="128" required="true" cssClass="span4" />
                            <form:errors path="nombreCompleto" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    <s:bind path="organizacion.centroCostoId">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="cuentaNombre">
                                <s:message code="centroCosto.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <input type="hidden" name="cuentaId" id="cuentaId" value="${organizacion.centroCostoId}" />
                            <input type="text" name="cuentaNombre" id="cuentaNombre" value="${organizacion.centroCostoId}" required="true" class="span8" />
                            <form:errors path="centroCostoId" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                </fieldset>

                <p class="well" style="margin-top: 10px;">
                    <button type="submit" name="crearBtn" class="btn btn-primary btn-large" id="crear" ><i class="icon-ok icon-white"></i>&nbsp;<s:message code='crear.button'/></button>
                    <a class="btn btn-large" href="<s:url value='/admin/organizacion'/>"><i class="icon-remove"></i> <s:message code='cancelar.button' /></a>
                </p>
            </form:form>
        </div>
        <content>
            <script>
                $(document).ready(function() {
                    $('input#cuentaNombre').autocomplete({
                        source: "<c:url value='/admin/organizacion/centrosDeCosto' />",
                        select: function(event, ui) {
                            $("input#cuentaId").val(ui.item.id);
                            $("input#cuentaNombre").focus();
                            return false;
                        }
                    });
                    
                    $('input#codigo').focus();
                });
            </script>                    
        </content>
    </body>
</html>
