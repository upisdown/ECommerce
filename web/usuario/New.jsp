<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    
    
    
    
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Usuario</title>
            <link rel="stylesheet" type="text/css" href="/Eshopper/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Usuario</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{usuario.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Name:"/>
                    <h:inputText id="name" value="#{usuario.usuario.name}" title="Name" required="true" requiredMessage="The name field is required." />
                    <h:outputText value="Lastname:"/>
                    <h:inputText id="lastname" value="#{usuario.usuario.lastname}" title="Lastname" required="true" requiredMessage="The lastname field is required." />
                    <h:outputText value="Dob (MM/dd/yyyy):"/>
                    <h:inputText id="dob" value="#{usuario.usuario.dob}" title="Dob" required="true" requiredMessage="The dob field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="Email:"/>
                    <h:inputText id="email" value="#{usuario.usuario.email}" title="Email" required="true" requiredMessage="The email field is required." />
                    <h:outputText value="Username:"/>
                    <h:inputText id="username" value="#{usuario.usuario.username}" title="Username" required="true" requiredMessage="The username field is required." />
                    <h:outputText value="Password:"/>
                    <h:inputText id="password" value="#{usuario.usuario.password}" title="Password" required="true" requiredMessage="The password field is required." />
                    <h:outputText value="IdRol:"/>
                    <h:selectOneMenu id="idRol" value="#{usuario.usuario.idRol}" title="IdRol" required="true" requiredMessage="The idRol field is required." >
                        <f:selectItems value="#{rol.rolItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{usuario.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{usuario.listSetup}" value="Show All Usuario Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
