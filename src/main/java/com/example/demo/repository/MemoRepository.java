package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Memo;

@Mapper
public interface MemoRepository {

	@Select("SELECT LAST_INSERT_ID()")
	int getLastInsertId();

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
			LEFT JOIN room AS R
			ON M.roomId = R.id
			LEFT JOIN building AS B
			ON R.bldgId = B.id
			LEFT JOIN tenant AS T
			ON M.tenantId = T.id
			LEFT JOIN contract AS C
			ON M.contractId = C.id
			LEFT JOIN memo_board AS MB
			ON M.boardId = MB.id
			WHERE M.boardId = 5;
			""")
	List<Memo> getMemoRepairs();

	@Select("""
			SELECT *
			FROM memo AS M
			LEFT JOIN room AS R
			ON M.roomId = R.id
			LEFT JOIN building AS B
			ON R.bldgId = B.id
			LEFT JOIN tenant AS T
			ON M.tenantId = T.id
			LEFT JOIN contract AS C
			ON M.contractId = C.id
			LEFT JOIN memo_board AS MB
			ON M.boardId = MB.id
			WHERE M.boardId = 6;
			""")
	List<Memo> getMemoExpenses();


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
	List<Memo> getMemoNotices(int bldgId); // 혹시 나중에 유용할까봐. 지출내역할 때

	@Insert("""
			INSERT INTO
			memo SET
			regDate = NOW(),
			updateDate = NOW(),
			memberId = #{memberId},
			bldgId = #{bldgId},
			roomId = #{roomId},
			boardId = #{boardId},
			tenantId = #{tenantId},
			contractId = #{contractId},
			title = #{title},
			`body` = #{body},
			memoDate = #{memoDate},
			cost = #{cost}
			""")
	void addMemo(int memberId, int bldgId, int roomId, int boardId, int tenantId, int contractId, String title,
			String body, String memoDate, int cost);

	
}
