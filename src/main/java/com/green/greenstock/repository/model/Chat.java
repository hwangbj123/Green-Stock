package com.green.greenstock.repository.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.data.annotation.CreatedDate;

import lombok.Builder;
import lombok.Data;

@Entity
@Data
public class Chat {
	@Id
	@GeneratedValue
	@Column(name="chat_id")
	private Long id;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="room_id")
	private Room room;
	
	private String sender;
	
	@Column(columnDefinition = "TEXT")
	private String message;
	
	@CreatedDate
	@Column(updatable = false)
	private LocalDateTime sendDate;
	
	@Builder
	public Chat(Room room, String sender, String message) {
		this.room = room;
		this.sender = sender;
		this.message = message;
		this.sendDate = LocalDateTime.now();
	}
	
	// 채팅 생성
	public static Chat createChat(Room room, String sender, String message) {
		return Chat.builder()
				.room(room)
				.sender(sender)
				.message(message)
				.build();
	}
}
