package com.dev.erp.member.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member implements Serializable {

	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;

	private int emp_id;
	private String emp_name;
	private String emp_no;
	private String email;
	private int phone;
	private String dept_code;
	private String job_code;
	private Date hire_date;
	private Date quit_date;
	private String quit_yn;
	private String password;
	
}
