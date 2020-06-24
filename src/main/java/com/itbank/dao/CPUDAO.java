package com.itbank.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itbank.vo.CPUVO;

@Repository
public class CPUDAO {
	
	@Autowired SqlSessionTemplate sst;

	public List<CPUVO> selectAll() {
		return sst.selectList("cpu.selectAll");
	}
	
	public int countAll() {
		return sst.selectOne("cpu.countAll");
	}
}
