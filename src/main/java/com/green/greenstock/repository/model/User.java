package com.green.greenstock.repository.model;

import java.sql.Date;
import java.sql.Timestamp;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class User {
	private Integer id;
	private String userName;
	private String password;
	private String email;
	private String tel;
	private Date birthDate;
	private Timestamp regDate;
	private Integer roletypeId;
}