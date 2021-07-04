/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package locdq.dtos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author test
 */
public class CartDTO {
    private Map<String, ProductDTO> cart;

    public CartDTO() {
    }

    public CartDTO(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    /**
     * @return the cart
     */
    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    /**
     * @param cart the cart to set
     */
    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }
    
    public void add(ProductDTO pro){
        if (this.cart==null){
            this.cart=new HashMap<String,ProductDTO>();
        }
        if (this.cart.containsKey(pro.getProductID())){
            int count=cart.get(pro.getProductID()).getNumber();
            pro.setNumber(count+pro.getNumber());
        }
        this.cart.put(pro.getProductID(), pro);
    }
    
    public void delete(String id){
        if (this.cart==null){
            return;
        }
        if (this.cart.containsKey(id)){
            this.cart.remove(id);
        }
    }
    
    public void update(String id,ProductDTO pro){
        if (this.cart==null){
            return;
        }
        if (this.cart.containsKey(id)){
            this.cart.replace(id, pro);
        }
    }
}
