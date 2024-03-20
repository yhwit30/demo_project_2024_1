package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Memo;

@Mapper
public interface MemoRepository {

	@Select("""
			SELECT *
			FROM memo AS M
			LEFT JOIN building AS B
			ON M.bldgId = B.id
			LEFT JOIN room AS R
			ON M.roomId = R.id
			LEFT JOIN tenant AS T
			ON M.tenantId = T.id
			LEFT JOIN contract AS C
			ON M.contractId = C.id
			LEFT JOIN memo_board AS MB
			ON M.boardId = MB.id
			WHERE M.id = #{memoId};
			""")
	Memo getMemo(int memoId);

	@Select("""
			SELECT *
			FROM memo AS M
			LEFT JOIN building AS B
			ON M.bldgId = B.id
			LEFT JOIN room AS R
			ON M.roomId = R.id
			LEFT JOIN tenant AS T
			ON M.tenantId = T.id
			LEFT JOIN contract AS C
			ON M.contractId = C.id
			LEFT JOIN memo_board AS MB
			ON M.boardId = MB.id
			WHERE M.boardId = 6;
			""")
	List<Memo> getMemoRepairs();

	@Select("""
			<script>
			SELECT *
			FROM memo AS M
			LEFT JOIN building AS B
			ON M.bldgId = B.id
			LEFT JOIN room AS R
			ON M.roomId = R.id
			LEFT JOIN tenant AS T
			ON M.tenantId = T.id
			LEFT JOIN contract AS C
			ON M.contractId = C.id
			LEFT JOIN memo_board AS MB
			ON M.boardId = MB.id
			WHERE M.boardId = 7
			<if test="bldgId != 0">
				AND M.bldgId = #{bldgId}
			</if>
			</script>
			""")
	List<Memo> getMemoNotices(int bldgId);

}
