
package com.HospitalManagementSystem.model;


public class Patient {
    
    // data cannot be accible to people or koni override kela nhi pahije for that purpose we can used encapsulation.
    
    private int      patient_id;
    private String   fullname;
    private String   email;
    private long      phone;
    private String   password;
    private String   gender;
    private int      age;
    private String   blood_group;
    private String   address;
    
    // click alt+insert go to getter and setter option select all.

    public int getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(int patient_id) {
        this.patient_id = patient_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getBlood_group() {
        return blood_group;
    }

    public void setBlood_group(String blood_group) {
        this.blood_group = blood_group;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    // now click alt+insert and click constructor , because whan we create a object of patientclass then we need .

    public Patient(String fullname, String email, int phone, String password, String gender, int age, String blood_group, String address) {
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.gender = gender;
        this.age = age;
        this.blood_group = blood_group;
        this.address = address;
    }
    
    // we are generate two constructor first ismai id nhi hai or dusre is mai id hai patient ki.

    public Patient(int patient_id, String fullname, String email, int phone, String password, String gender, int age, String blood_group, String address) {
        this.patient_id = patient_id;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.gender = gender;
        this.age = age;
        this.blood_group = blood_group;
        this.address = address;
    }
    
    // or one is default constructor if argument is not pass then this constructor will be executed . 

    public Patient() {
    }
    
    // agar patient ka direct koni output print karnar asnar console mdhe tar toString function click alt+insert .

    @Override
    public String toString() {
        return "Patient{" + "patient_id=" + patient_id + ", fullname=" + fullname + ", email=" + email + ", phone=" + phone + ", password=" + password + ", gender=" + gender + ", age=" + age + ", blood_group=" + blood_group + ", address=" + address + '}';
    }
    
    
    
}
