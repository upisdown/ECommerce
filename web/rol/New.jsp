<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Rol</title>
            <link rel="stylesheet" type="text/css" href="/Eshopper/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Rol</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{rol.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Nombre:"/>
                    <h:inputText id="nombre" value="#{rol.rol.nombre}" title="Nombre" required="true" requiredMessage="The nombre field is required." />
                    <h:outputText value="Descripcion:"/>
                    <h:inputText id="descripcion" value="#{rol.rol.descripcion}" title="Descripcion" required="true" requiredMessage="The descripcion field is required." />
                    <h:outputText value="Estado:"/>
                    <h:inputText id="estado" value="#{rol.rol.estado}" title="Estado" required="true" requiredMessage="The estado field is required." />
                    <h:outputText value="UsuarioCollection:"/>
                    <h:selectManyListbox id="usuarioCollection" value="#{rol.rol.jsfcrud_transform[jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method.arrayToList].usuarioCollection}" title="UsuarioCollection" size="6" converter="#{usuario.converter}" >
                        <f:selectItems value="#{usuario.usuarioItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{rol.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{rol.listSetup}" value="Show All Rol Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
