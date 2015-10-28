/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jpa.jfs;

import com.entities.Rol;
import com.jpa.controller.RolFacade;
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
public class RolController {

    public RolController() {
        pagingInfo = new PagingInfo();
        converter = new RolConverter();
    }
    private Rol rol = null;
    private List<Rol> rolItems = null;
    private RolFacade jpaController = null;
    private RolConverter converter = null;
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

    public RolFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (RolFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "rolJpa");
        }
        return jpaController;
    }

    public SelectItem[] getRolItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getRolItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Rol getRol() {
        if (rol == null) {
            rol = (Rol) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentRol", converter, null);
        }
        if (rol == null) {
            rol = new Rol();
        }
        return rol;
    }

    public String listSetup() {
        reset(true);
        return "rol_list";
    }

    public String createSetup() {
        reset(false);
        rol = new Rol();
        return "rol_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(rol);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Rol was successfully created.");
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
        return scalarSetup("rol_detail");
    }

    public String editSetup() {
        return scalarSetup("rol_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        rol = (Rol) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentRol", converter, null);
        if (rol == null) {
            String requestRolString = JsfUtil.getRequestParameter("jsfcrud.currentRol");
            JsfUtil.addErrorMessage("The rol with id " + requestRolString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String rolString = converter.getAsString(FacesContext.getCurrentInstance(), null, rol);
        String currentRolString = JsfUtil.getRequestParameter("jsfcrud.currentRol");
        if (rolString == null || rolString.length() == 0 || !rolString.equals(currentRolString)) {
            String outcome = editSetup();
            if ("rol_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit rol. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(rol);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Rol was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentRol");
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
                JsfUtil.addSuccessMessage("Rol was successfully deleted.");
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

    public List<Rol> getRolItems() {
        if (rolItems == null) {
            getPagingInfo();
            rolItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return rolItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "rol_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "rol_list";
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
        rol = null;
        rolItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Rol newRol = new Rol();
        String newRolString = converter.getAsString(FacesContext.getCurrentInstance(), null, newRol);
        String rolString = converter.getAsString(FacesContext.getCurrentInstance(), null, rol);
        if (!newRolString.equals(rolString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
