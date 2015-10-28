package com.jpa.bean;

import com.jpa.bean.util.MobilePageController;
import com.entities.Usuario;
import javax.inject.Named;
import javax.faces.view.ViewScoped;
import javax.faces.event.ActionEvent;
import javax.inject.Inject;

@Named(value = "usuarioController")
@ViewScoped
public class UsuarioController extends AbstractController<Usuario> {

    @Inject
    private RolController idRolController;
    @Inject
    private MobilePageController mobilePageController;

    public UsuarioController() {
        // Inform the Abstract parent controller of the concrete Usuario Entity
        super(Usuario.class);
    }

    /**
     * Resets the "selected" attribute of any parent Entity controllers.
     */
    public void resetParents() {
        idRolController.setSelected(null);
    }

    /**
     * Sets the "selected" attribute of the Rol controller in order to display
     * its data in its View dialog.
     *
     * @param event Event object for the widget that triggered an saveNewction
     */
    public void prepareIdRol(ActionEvent event) {
        if (this.getSelected() != null && idRolController.getSelected() == null) {
            idRolController.setSelected(this.getSelected().getIdRol());
        }
    }
}
