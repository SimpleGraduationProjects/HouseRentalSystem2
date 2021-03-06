package com.model;

import java.math.BigDecimal;
import java.util.Date;

public class Repair {
    private String roomName;
    private String repairstatus;

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    private String customerName;

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repair.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repair.room_id
     *
     * @mbggenerated
     */
    private Integer roomId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repair.create_time
     *
     * @mbggenerated
     */
    private Date createTime;



    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repair.customer_id
     *
     * @mbggenerated
     */
    private String customer_id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repair.info
     *
     * @mbggenerated
     */
    private String info;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repair.title
     *
     * @mbggenerated
     */
    private String title;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repair.id
     *
     * @return the value of repair.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repair.id
     *
     * @param id the value for repair.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repair.room_id
     *
     * @return the value of repair.room_id
     *
     * @mbggenerated
     */
    public Integer getRoomId() {
        return roomId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repair.room_id
     *
     * @param roomId the value for repair.room_id
     *
     * @mbggenerated
     */
    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repair.create_time
     *
     * @return the value of repair.create_time
     *
     * @mbggenerated
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repair.create_time
     *
     * @param createTime the value for repair.create_time
     *
     * @mbggenerated
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }




    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repair.customer_id
     *
     * @return the value of repair.customer_id
     *
     * @mbggenerated
     */
    public String getCustomer_id() {
        return customer_id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repair.customer_id
     *
     * @param customer_id the value for repair.customer_id
     *
     * @mbggenerated
     */
    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repair.info
     *
     * @return the value of repair.info
     *
     * @mbggenerated
     */
    public String getInfo() {
        return info;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repair.info
     *
     * @param info the value for repair.info
     *
     * @mbggenerated
     */
    public void setInfo(String info) {
        this.info = info;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repair.title
     *
     * @return the value of repair.title
     *
     * @mbggenerated
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repair.title
     *
     * @param title the value for repair.title
     *
     * @mbggenerated
     */
    public void setTitle(String title) {
        this.title = title;
    }

    public String getRepairstatus() {
        return repairstatus;
    }

    public void setRepairstatus(String repairstatus) {
        this.repairstatus = repairstatus;
    }

}