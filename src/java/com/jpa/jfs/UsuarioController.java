/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jpa.jfs;

import com.entities.Usuario;
import com.jpa.controller.UsuarioFacade;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import com.jpa.jfs.util.JsfUtil;
import com.jpa.jfs.util.PagingInfo;
import java.util.List;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

/**
 *
 * @author Usuario
 */
public class UsuarioController {

    public UsuarioController() {
        pagingInfo = new PagingInfo();
        converter = new UsuarioConverter();
    }
    private Usuario usuario = null;
    private List<Usuario> usuarioItems = null;
    private UsuarioFacade jpaController = null;
    private UsuarioConverter converter = null;
    private PagingInfo pagingInfo = null;
    @Resource
    private UserTransaction utx = null;
    @PersistenceUnit(unitName = "EshopperPU")
    private EntityManagerFactory emf = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(getJpaController().count());
        }
        return pagingInfo;
    }

    public UsuarioFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (UsuarioFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "usuarioJpa");
        }
        return jpaController;
    }

    public SelectItem[] getUsuarioItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getUsuarioItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Usuario getUsuario() {
        if (usuario == null) {
            usuario = (Usuario) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentUsuario", converter, null);
        }
        if (usuario == null) {
            usuario = new Usuario();
        }
        return usuario;
    }

    public String listSetup() {
        reset(true);
        return "usuario_list";
    }

    public String createSetup() {
        reset(false);
        usuario = new Usuario();
        return "usuario_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(usuario);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Usuario was successfully created.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("usuario_detail");
    }

    public String editSetup() {
        return scalarSetup("usuario_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        usuario = (Usuario) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentUsuario", converter, null);
        if (usuario == null) {
            String requestUsuarioString = JsfUtil.getRequestParameter("jsfcrud.currentUsuario");
            JsfUtil.addErrorMessage("The usuario with id " + requestUsuarioString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String usuarioString = converter.getAsString(FacesContext.getCurrentInstance(), null, usuario);
        String currentUsuarioString = JsfUtil.getRequestParameter("jsfcrud.currentUsuario");
        if (usuarioString == null || usuarioString.length() == 0 || !usuarioString.equals(currentUsuarioString)) {
            String outcome = editSetup();
            if ("usuario_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit usuario. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(usuario);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Usuario was successfully updated.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentUsuario");
        Integer id = new Integer(idAsString);
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().remove(getJpaController().find(id));
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Usuario was successfully deleted.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        if (relatedControllerOutcome != null) {
            return relatedControllerOutcome;
        }
        return listSetup();
    }

    public List<Usuario> getUsuarioItems() {
        if (usuarioItems == null) {
            getPagingInfo();
            usuarioItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return usuarioItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "usuario_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "usuario_list";
    }

    private String relatedControllerOutcome() {
        String relatedControllerString = JsfUtil.getRequestParameter("jsfcrud.relatedController");
        String relatedControllerTypeString = JsfUtil.getRequestParameter("jsfcrud.relatedControllerType");
        if (relatedControllerString != null && relatedControllerTypeString != null) {
            FacesContext context = FacesContext.getCurrentInstance();
            Object relatedController = context.getApplication().getELResolver().getValue(context.getELContext(), null, relatedControllerString);
            try {
                Class<?> relatedControllerType = Class.forName(relatedControllerTypeString);
                Method detailSetupMethod = relatedControllerType.getMethod("detailSetup");
                return (String) detailSetupMethod.invoke(relatedController);
            } catch (ClassNotFoundException e) {
                throw new FacesException(e);
            } catch (NoSuchMethodException e) {
                throw new FacesException(e);
            } catch (IllegalAccessException e) {
                throw new FacesException(e);
            } catch (InvocationTargetException e) {
                throw new FacesException(e);
            }
        }
        return null;
    }

    private void reset(boolean resetFirstItem) {
        usuario = null;
        usuarioItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Usuario newUsuario = new Usuario();
        String newUsuarioString = converter.getAsString(FacesContext.getCurrentInstance(), null, newUsuario);
        String usuarioString = converter.getAsString(FacesContext.getCurrentInstance(), null, usuario);
        if (!newUsuarioString.equals(usuarioString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
