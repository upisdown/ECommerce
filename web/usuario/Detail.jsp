<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Usuario Detail</title>
            <link rel="stylesheet" type="text/css" href="/Eshopper/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Usuario Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Id:"/>
                    <h:outputText value="#{usuario.usuario.id}" title="Id" />
                    <h:outputText value="Name:"/>
                    <h:outputText value="#{usuario.usuario.name}" title="Name" />
                    <h:outputText value="Lastname:"/>
                    <h:outputText value="#{usuario.usuario.lastname}" title="Lastname" />
                    <h:outputText value="Dob:"/>
                    <h:outputText value="#{usuario.usuario.dob}" title="Dob" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>
                    <h:outputText value="Email:"/>
                    <h:outputText value="#{usuario.usuario.email}" title="Email" />
                    <h:outputText value="Username:"/>
                    <h:outputText value="#{usuario.usuario.username}" title="Username" />
                    <h:outputText value="Password:"/>
                    <h:outputText value="#{usuario.usuario.password}" title="Password" />
                    <h:outputText value="IdRol:"/>
                    <h:panelGroup>
                        <h:outputText value="#{usuario.usuario.idRol}"/>
                        <h:panelGroup rendered="#{usuario.usuario.idRol != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{rol.detailSetup}">
                                <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario][usuario.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentRol" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario.idRol][rol.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="usuario"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.jpa.jfs.UsuarioController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{rol.editSetup}">
                                <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario][usuario.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentRol" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario.idRol][rol.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="usuario"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.jpa.jfs.UsuarioController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{rol.destroy}">
                                <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario][usuario.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentRol" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario.idRol][rol.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="usuario"/>
                                <f:param name="jsfcrud.relatedControllerType" value="com.jpa.jfs.UsuarioController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>


                </h:panelGrid>
                <br />
                <h:commandLink action="#{usuario.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario][usuario.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{usuario.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['com.jpa.jfs.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario][usuario.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{usuario.createSetup}" value="New Usuario" />
                <br />
                <h:commandLink action="#{usuario.listSetup}" value="Show All Usuario Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
