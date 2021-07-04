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
public class ProductErrorDTO {
     private String productIDError;
    private String productNameError;
    private String quantityError;
    private String priceError;
    private String imgError;
    private String categoryIDError;

    public ProductErrorDTO() {
    }

    public ProductErrorDTO(String productIDError, String productNameError, String quantityError, String priceError, String imgError, String categoryIDError) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.quantityError = quantityError;
        this.priceError = priceError;
        this.imgError = imgError;
        this.categoryIDError = categoryIDError;
    }

    /**
     * @return the productIDError
     */
    public String getProductIDError() {
        return productIDError;
    }

    /**
     * @param productIDError the productIDError to set
     */
    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    /**
     * @return the productNameError
     */
    public String getProductNameError() {
        return productNameError;
    }

    /**
     * @param productNameError the productNameError to set
     */
    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    /**
     * @return the quantityError
     */
    public String getQuantityError() {
        return quantityError;
    }

    /**
     * @param quantityError the quantityError to set
     */
    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    /**
     * @return the priceError
     */
    public String getPriceError() {
        return priceError;
    }

    /**
     * @param priceError the priceError to set
     */
    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    /**
     * @return the imgError
     */
    public String getImgError() {
        return imgError;
    }

    /**
     * @param imgError the imgError to set
     */
    public void setImgError(String imgError) {
        this.imgError = imgError;
    }

    /**
     * @return the categoryIDError
     */
    public String getCategoryIDError() {
        return categoryIDError;
    }

    /**
     * @param categoryIDError the categoryIDError to set
     */
    public void setCategoryIDError(String categoryIDError) {
        this.categoryIDError = categoryIDError;
    }

    @Override
    public String toString() {
        return "ProductErrorDTO{" + "productIDError=" + productIDError + ", productNameError=" + productNameError + ", quantityError=" + quantityError + ", priceError=" + priceError + ", imgError=" + imgError + ", categoryIDError=" + categoryIDError + '}';
    }
    
}
