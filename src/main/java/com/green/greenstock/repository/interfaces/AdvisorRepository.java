package com.green.greenstock.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.greenstock.dto.AdminExpertDTO;
import com.green.greenstock.dto.PagingDto;
import com.green.greenstock.dto.RefuseDTO;
import com.green.greenstock.repository.model.Advisor;

@Mapper
public interface AdvisorRepository {

	Advisor findById(int advisorId);

	List<Advisor> findAll();

	List<Advisor> findByStatus(int status);

<<<<<<< HEAD
	void updateStatus(@Param("advisorId") int advisorId, @Param("status") int status);

	List<AdminExpertDTO> findAllInfoByStatus(int status);

	List<AdminExpertDTO> findAllInfoStatusAsc();

	void insertRefuseReason(@Param("advisorId") int advisorId, @Param("refuseMsg") String refuseMsg);
=======
    void updateStatus(@Param("advisorId") int advisorId,@Param("status") int status);
    
    List<AdminExpertDTO> findAllInfoByStatus(int status);
    
    List<AdminExpertDTO> findAllInfoStatusAsc();
>>>>>>> deadfe5d860d91811732fc12becc42191ba04993

	RefuseDTO findAdvisorRefuseByAdvisorId(int advisorId);

<<<<<<< HEAD
	List<AdminExpertDTO> findPagedInfoByStatus(@Param("status") int status, @Param("paging") PagingDto paging);

	List<Advisor> selectAdvisorList(int status);

}
=======
	List<AdminExpertDTO> findPagedInfoByStatus(@Param("status") int status,@Param("paging") PagingDto paging);

    List<Advisor> selectAdvisorList(int stauts);
    
}
>>>>>>> deadfe5d860d91811732fc12becc42191ba04993
