package com.green.greenstock.repository.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Builder;
import lombok.Data;

@Entity
@Data
public class Room {
// 채팅방
	@Id
	@GeneratedValue
	@Column(name="room_id")
	private Long id;
	private String name;
	
	@Builder
	public Room(String name) {
		this.name = name;
	}
	
	// 채팅방 생성
	public static Room createRoom(String name) {
		return Room.builder().name(name).build();
	}
}
