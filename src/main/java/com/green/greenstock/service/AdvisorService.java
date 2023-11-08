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
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.green.greenstock.dto.AdvisorReqDto;
import com.green.greenstock.dto.AdvisorResDto;
import com.green.greenstock.handler.exception.CustomRestfulException;
import com.green.greenstock.repository.entity.AdvisorEntity;
import com.green.greenstock.repository.entity.ImageEntity;
import com.green.greenstock.repository.interfaces.AdvisorBoardEntityRepository;
import com.green.greenstock.repository.interfaces.AdvisorEntityRepository;
import com.green.greenstock.repository.interfaces.AdvisorRepository;
import com.green.greenstock.repository.interfaces.ImageEntityRepository;
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

    @Value("${spring.servlet.multipart.location}")
    private String filePath;

    /**
     * 전문가 리스트 가져오기(승인(2)된 유저만)
     * @param status
     * @return 전문가리스트
     */
    public List<AdvisorResDto> findByStatusAuth(int status) {
        List<AdvisorEntity> advisorEntities = advisorEntityRepository.findByStatus(status);
        List<AdvisorResDto> advisorResDtos = new ArrayList<>();
        for(AdvisorEntity advisorEntity : advisorEntities){
            AdvisorResDto dto = new AdvisorResDto();
            advisorResDtos.add(dto.fromEntity(advisorEntity));
        }

        return advisorResDtos;
    }

    /**
     * 닉네임으로 전문가 한명 가져오기
     * @param nickName
     * @return 전문가 한명
     */
    public AdvisorResDto findByAdvisorNickName(String nickName) {
        AdvisorResDto advisorResDto = new AdvisorResDto();
        AdvisorEntity advisorEntity= advisorEntityRepository.findByAdvisorNickName(nickName);
        return advisorResDto.fromEntity(advisorEntity);
    }

    /**
     * 전문가 신청하기
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
        ImageEntity imageEntity = imageEntityRepository.save(
                ImageEntity
                        .builder()
                        .imgName(newImagePathAndName)
                        .build());

        return imageEntity;
    }

	public Advisor findAdvisorById(int advisorId) {
		return advisorRepository.findById(advisorId);
		
	}

}
