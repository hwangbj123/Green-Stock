package com.green.greenstock.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.green.greenstock.dto.AdvisorBoardResDto;
import com.green.greenstock.dto.AdvisorReqDto;
import com.green.greenstock.dto.AdvisorResDto;
import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.handler.exception.PageNotFoundException;
import com.green.greenstock.repository.entity.AdvisorBoardEntity;
import com.green.greenstock.repository.entity.AdvisorEntity;
import com.green.greenstock.repository.entity.ImageEntity;
import com.green.greenstock.repository.entity.SubscribeToAdvisorEntity;
import com.green.greenstock.repository.entity.UserEntity;
import com.green.greenstock.repository.interfaces.AdvisorBoardEntityRepository;
import com.green.greenstock.repository.interfaces.AdvisorEntityRepository;
import com.green.greenstock.repository.interfaces.AdvisorRepository;
import com.green.greenstock.repository.interfaces.ImageEntityRepository;
import com.green.greenstock.repository.interfaces.SubscribeToAdvisorEntityRepository;
import com.green.greenstock.repository.interfaces.UserEntityRepository;
import com.green.greenstock.repository.model.Advisor;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class AdvisorService {

    private final AdvisorEntityRepository advisorEntityRepository;
    private final AdvisorBoardEntityRepository advisorBoardEntityRepository;
    private final ImageEntityRepository imageEntityRepository;
    private final AdvisorRepository advisorRepository;
    private final SubscribeToAdvisorEntityRepository subscribeToAdvisorEntityRepository;
    private final UserEntityRepository userEntityRepository;

    @Value("${spring.servlet.multipart.location}")
    private String filePath;

    /**
     * 전문가 리스트 가져오기(승인(2)된 유저만)
     * 
     * @param status
     * @return 전문가리스트
     */
    @Transactional
    public List<AdvisorResDto> findByStatusAuth(int status) {
        List<AdvisorEntity> advisorEntities = advisorEntityRepository.findByStatus(status);
        List<AdvisorResDto> advisorResDtos = new ArrayList<>();
        for (AdvisorEntity advisorEntity : advisorEntities) {
            AdvisorResDto dto = new AdvisorResDto();
            advisorResDtos.add(dto.fromEntity(advisorEntity));
        }

        return advisorResDtos;
    }

    /**
     * 닉네임으로 전문가 한명 가져오기
     * 
     * @param nickName
     * @return 전문가 한명
     */
    @Transactional
    public AdvisorResDto findByAdvisorNickName(String nickName) {
        AdvisorResDto advisorResDto = new AdvisorResDto();
        AdvisorEntity advisorEntity = advisorEntityRepository.findByAdvisorNickName(nickName);
        if (advisorEntity == null) {
            throw new PageNotFoundException("전문가를 찾을 수 없습니다.", "/advisor/list");
        }
        return advisorResDto.fromEntity(advisorEntity);
    }

    /**
     * 전문가 신청하기
     * 
     * @param advisorReqDto
     */
    @Transactional
    public void saveAdvisor(AdvisorReqDto advisorReqDto) {
        // dto-entity변환
        AdvisorEntity advisorEntity = AdvisorEntity.toEntity(advisorReqDto);
        AdvisorEntity savedAdvisorEntity = advisorEntityRepository.save(advisorEntity);

        // 이미지 저장
        MultipartFile multipartFile = advisorReqDto.getProfilePhoto();

        // 이미지 업로드
        ImageEntity imageEntity = uploadImage(multipartFile);

        if (imageEntity.getImgId() == 0) {
            throw new CustomRestfulException("신청이 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        // 이미지 테이블 번호 넣기
        savedAdvisorEntity.setImageEntity(imageEntity);

    }

    /**
     * 이미지 업로드
     * 
     * @param multipartFile
     * @return ImageEntity
     */
    @Transactional
    public ImageEntity uploadImage(MultipartFile multipartFile) {

        // 중복 파일 이름 방지
        String oriFileName = multipartFile.getOriginalFilename(); // 파일 원본 이름 가져오기
        String uuidStr = UUID.randomUUID().toString(); // 랜덤문자 가져오기
        LocalDate now = LocalDate.now(); // 현재시간 가져오기
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMdd"); // 시간 포맷 지정
        String formatedNow = now.format(dateTimeFormatter); // 시간 포맷 변환
        String newFileName = uuidStr;
        if (oriFileName != null) {
            int extIndex = oriFileName.indexOf("."); // . 인덱스 가져오기
            String ext = oriFileName.substring(extIndex); // .확장자 가져오기
            newFileName += ext; // 시간_UUID.확장자
        }
        String newDatefolderPath = filePath + formatedNow + File.separator; // 기존 폴더/연월일/
        // 폴더 확인 없으면 업로드 날짜(yyyyMMdd)로 폴더 생성
        File folder = new File(newDatefolderPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }
        Path path = Paths.get(newDatefolderPath, newFileName); // 파일 생성(경로 + 파일)
        // 파일 업로드!
        try {
            Files.write(path, multipartFile.getBytes());
        } catch (Exception e) {
            log.error(e.getMessage());
        }
        // 경로 + 파일 이름(경로/파일이름)
        String newImagePathAndName = formatedNow + File.separator + newFileName;
        log.info("저장된 이미지경로와 이름: {}", newImagePathAndName);

        // 이미지 테이블에 저장
        return imageEntityRepository.save(
                ImageEntity
                        .builder()
                        .imgName(newImagePathAndName)
                        .build());
    }

    public Advisor findAdvisorById(int advisorId) {
        return advisorRepository.findById(advisorId);

    }

    /**
     * 전문가 구독하기 기능
     * 
     * @param advisorId
     * @param userId
     */
    @Transactional
    public void saveSubscribeToAdvisor(int advisorId, int userId) {
        AdvisorEntity advisorEntity = advisorEntityRepository.findById(advisorId)
                .orElseThrow(() -> new CustomRestfulException("존재하지 않는 전문가입니다.", HttpStatus.BAD_REQUEST));
        UserEntity userEntity = userEntityRepository.findById(userId)
                .orElseThrow(() -> new CustomRestfulException("존재하지 않는 사용자입니다.", HttpStatus.BAD_REQUEST));

        SubscribeToAdvisorEntity entity = SubscribeToAdvisorEntity
                .builder()
                .advisorEntity(advisorEntity)
                .userEntity(userEntity)
                .build();

        subscribeToAdvisorEntityRepository.save(entity);

    }

    // 구독 유효성 체크
    @Transactional
    public boolean validateSubscribeToAdvisor(String nickName, int userId) {

        AdvisorEntity advisorEntity = advisorEntityRepository.findByAdvisorNickName(nickName);
        UserEntity userEntity = userEntityRepository.findById(userId)
                .orElseThrow(() -> new CustomRestfulException("아이디를 찾을수 없습니다.", HttpStatus.BAD_REQUEST));

        SubscribeToAdvisorEntity subscribeToAdvisorEntity = subscribeToAdvisorEntityRepository
                .findByAdvisorEntityAndUserEntity(advisorEntity, userEntity);

        return subscribeToAdvisorEntity != null;
    }

    // 전문가 상담 게시판 리스트(일반 글)
    @Transactional
    public Page<AdvisorBoardResDto> findByAdvisorEntityAndParent(String nickName, int parent, Pageable pageable) {

        AdvisorEntity advisorEntity = advisorEntityRepository.findByAdvisorNickName(nickName);

        Page<AdvisorBoardEntity> advisorBoardEntities = advisorBoardEntityRepository
                .findByAdvisorEntityAndParent(advisorEntity, parent, pageable);

        return advisorBoardEntities.map(entity -> {
            return AdvisorBoardResDto
                    .builder()
                    .advisorBoardId(entity.getAdvisorBoardId())
                    .title(entity.getTitle())
                    .content(entity.getContent())
                    .parent(entity.getParent())
                    .createdAt(entity.getCreatedAt().toString())
                    .userId(entity.getUserEntity().getId())
                    .userName(entity.getUserEntity().getUserName())
                    .advisorId(entity.getAdvisorEntity().getAdvisorId())
                    .advisorNickname(entity.getAdvisorEntity().getAdvisorNickName())
                    .views(entity.getViews())
                    .build();
        });
    }
}
