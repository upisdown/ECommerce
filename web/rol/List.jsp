<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Rol Items</title>
            <link rel="stylesheet" type="text/css" href="/Eshopper/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Rol Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Rol Items Found)<br />" rendered="#{rol.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{rol.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{rol.pagingInfo.firstItem + 1}..#{rol.pagingInfo.lastItem} of #{rol.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{rol.prev}" value="Previous #{rol.pagingInfo.batchSize}" rendered="#{rol.pagingInfo.firstItem >= rol.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{rol.next}" value="Next #{rol.pagingInfo.batchSize}" rendered="#{rol.pagingInfo.lastItem + rol.pagingInfo.batchSize <= rol.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{rol.next}" value="Remaining #{rol.pagingInfo.itemCount - rol.pagingInfo.lastItem}"
                                   rendered="#{rol.pagingInfo.lastItem < rol.pagingInfo.itemCount && rol.pagingInfo.lastItem + rol.pagingInfo.batchSize > rol.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{rol.rolItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Id"/>
                            </f:facet>
                            <h:outputText value="#{item.id}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Nombre"/>
                            </f:facet>
                            <h:outputText value="#{item.nombre}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Descripcion"/>
                            </f:facet>
                            <h:outputText value="#{item.descripcion}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Estado"/>
                            </f:facet>
                            <h:outputText value="#{item.estado}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{rol.detailSetup}">
                                <f:param name="jsfcrud.currentRol" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][rol.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{rol.editSetup}">
                                <f:param name="jsfcrud.currentRol" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][rol.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{rol.remove}">
                                <f:param name="jsfcrud.currentRol" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][rol.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{rol.createSetup}" value="New Rol"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
