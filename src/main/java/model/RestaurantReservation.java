package model;

import java.sql.Date;
import java.sql.Time;

public class RestaurantReservation {
    private int id;
    private String customerName;
    private String mobile;
    private String email;
    private int guestCount;
    private Date reservationDate;
    private Time reservationTime;
    private String note;
    private String status;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public int getGuestCount() { return guestCount; }
    public void setGuestCount(int guestCount) { this.guestCount = guestCount; }
    public Date getReservationDate() { return reservationDate; }
    public void setReservationDate(Date reservationDate) { this.reservationDate = reservationDate; }
    public Time getReservationTime() { return reservationTime; }
    public void setReservationTime(Time reservationTime) { this.reservationTime = reservationTime; }
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
