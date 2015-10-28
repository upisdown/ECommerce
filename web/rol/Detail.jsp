<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Rol Detail</title>
            <link rel="stylesheet" type="text/css" href="/Eshopper/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Rol Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Id:"/>
                    <h:outputText value="#{rol.rol.id}" title="Id" />
                    <h:outputText value="Nombre:"/>
                    <h:outputText value="#{rol.rol.nombre}" title="Nombre" />
                    <h:outputText value="Descripcion:"/>
                    <h:outputText value="#{rol.rol.descripcion}" title="Descripcion" />
                    <h:outputText value="Estado:"/>
                    <h:outputText value="#{rol.rol.estado}" title="Estado" />

                    <h:outputText value="UsuarioCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty rol.rol.usuarioCollection}" value="(No Items)"/>
                        <h:dataTable value="#{rol.rol.usuarioCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty rol.rol.usuarioCollection}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Id"/>
                                </f:facet>
                                <h:outputText value="#{item.id}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Name"/>
                                </f:facet>
                                <h:outputText value="#{item.name}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Lastname"/>
                                </f:facet>
                                <h:outputText value="#{item.lastname}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Dob"/>
                                </f:facet>
                                <h:outputText value="#{item.dob}">
                                    <f:convertDateTime pattern="MM/dd/yyyy" />
                                </h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Email"/>
                                </f:facet>
                                <h:outputText value="#{item.email}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Username"/>
                                </f:facet>
                                <h:outputText value="#{item.username}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Password"/>
                                </f:facet>
                                <h:outputText value="#{item.password}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="IdRol"/>
                                </f:facet>
                                <h:outputText value="#{item.idRol}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{usuario.detailSetup}">
                                    <f:param name="jsfcrud.currentRol" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rol.rol][rol.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][usuario.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="rol" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.jpa.jfs.RolController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{usuario.editSetup}">
                                    <f:param name="jsfcrud.currentRol" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rol.rol][rol.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][usuario.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="rol" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.jpa.jfs.RolController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{usuario.destroy}">
                                    <f:param name="jsfcrud.currentRol" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rol.rol][rol.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][usuario.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="rol" />
                                    <f:param name="jsfcrud.relatedControllerType" value="com.jpa.jfs.RolController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{rol.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentRol" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rol.rol][rol.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{rol.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentRol" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][rol.rol][rol.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{rol.createSetup}" value="New Rol" />
                <br />
                <h:commandLink action="#{rol.listSetup}" value="Show All Rol Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
