package com.jh.tripleb.student.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jh.tripleb.student.model.vo.StudentDtoJ;

@Repository("stDao")
public class StudentDao {

	public ArrayList<StudentDtoJ> selectList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("studentMapper.selectList");
	}
}
