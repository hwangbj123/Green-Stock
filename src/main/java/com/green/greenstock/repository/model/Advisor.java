package com.green.greenstock.repository.model;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import com.green.greenstock.repository.entity.UserEntity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@EntityListeners(AuditingEntityListener.class)
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Advisor {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int advisorId;
    //private int userId;
    @Column(nullable = false)
    private String advisor_full_name;
    @Column(nullable = false)
    private String advisor_nick_name;
    @Column(columnDefinition = "TEXT", nullable = false)
    private String career;
    @Column(columnDefinition = "TEXT", nullable = false)
    private String introduction;
    @CreatedDate
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "advisor")
    private List<AdvisorBoard> advisorBoards;

    @OneToOne
    @JoinColumn(name = "userId", referencedColumnName = "id")
    private UserEntity userEntity;


}
