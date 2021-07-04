/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package locdq.dtos;

/**
 *
 * @author test
 */
public class UserErrorDTO {
    private String userErrorID;
    private String fullErrorName;
    private String phoneError;
    private String addressError;
    private String passwordError;
    private String confirm;
    private String roleIDError;

    public UserErrorDTO() {
    }

    public UserErrorDTO(String userErrorID, String fullErrorName, String phoneError, String addressError, String passwordError, String roleIDError,String confirm) {
        this.userErrorID = userErrorID;
        this.fullErrorName = fullErrorName;
        this.phoneError = phoneError;
        this.addressError = addressError;
        this.passwordError = passwordError;
        this.roleIDError = roleIDError;
        this.confirm=confirm;
    }

    /**
     * @return the userErrorID
     */
    public String getUserErrorID() {
        return userErrorID;
    }

    /**
     * @param userErrorID the userErrorID to set
     */
    public void setUserErrorID(String userErrorID) {
        this.userErrorID = userErrorID;
    }

    /**
     * @return the fullErrorName
     */
    public String getFullErrorName() {
        return fullErrorName;
    }

    /**
     * @param fullErrorName the fullErrorName to set
     */
    public void setFullErrorName(String fullErrorName) {
        this.fullErrorName = fullErrorName;
    }

    /**
     * @return the phoneError
     */
    public String getPhoneError() {
        return phoneError;
    }

    /**
     * @param phoneError the phoneError to set
     */
    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    /**
     * @return the addressError
     */
    public String getAddressError() {
        return addressError;
    }

    /**
     * @param addressError the addressError to set
     */
    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    /**
     * @return the passwordError
     */
    public String getPasswordError() {
        return passwordError;
    }

    /**
     * @param passwordError the passwordError to set
     */
    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    /**
     * @return the roleIDError
     */
    public String getRoleIDError() {
        return roleIDError;
    }

    /**
     * @param roleIDError the roleIDError to set
     */
    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    /**
     * @return the confirm
     */
    public String getConfirm() {
        return confirm;
    }

    /**
     * @param confirm the confirm to set
     */
    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    @Override
    public String toString() {
        return "UserErrorDTO{" + "userErrorID=" + userErrorID + ", fullErrorName=" + fullErrorName + ", phoneError=" + phoneError + ", addressError=" + addressError + ", passwordError=" + passwordError + ", confirm=" + confirm + ", roleIDError=" + roleIDError + '}';
    }
    
    
}
