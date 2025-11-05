package com.xworkz.Project.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Data
@Table(name = "admin_info")
@Setter
@Getter
@NamedQuery(name = "getByEmail",query = "select a from AdminEntity a where a.email=:email")
//@RequiredArgsConstructor
//@NoArgsConstructor
public class AdminEntity {

    @Id
    @Column(name = "admin_id")
    private Integer adminId;

    @Column(name = "name")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name = "psw")
    private String psw;



}
