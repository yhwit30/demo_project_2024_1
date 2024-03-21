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
			<script>
			SELECT *,
			MAX(CASE WHEN M.memoDate LIKE '${year}-01%' THEN M.memoDate ELSE NULL END) AS memoDate1,
			MAX(CASE WHEN M.memoDate LIKE '${year}-02%' THEN M.memoDate ELSE NULL END) AS memoDate2,
			MAX(CASE WHEN M.memoDate LIKE '${year}-03%' THEN M.memoDate ELSE NULL END) AS memoDate3,
			MAX(CASE WHEN M.memoDate LIKE '${year}-04%' THEN M.memoDate ELSE NULL END) AS memoDate4,
			MAX(CASE WHEN M.memoDate LIKE '${year}-05%' THEN M.memoDate ELSE NULL END) AS memoDate5,
			MAX(CASE WHEN M.memoDate LIKE '${year}-06%' THEN M.memoDate ELSE NULL END) AS memoDate6,
			MAX(CASE WHEN M.memoDate LIKE '${year}-07%' THEN M.memoDate ELSE NULL END) AS memoDate7,
			MAX(CASE WHEN M.memoDate LIKE '${year}-08%' THEN M.memoDate ELSE NULL END) AS memoDate8,
			MAX(CASE WHEN M.memoDate LIKE '${year}-09%' THEN M.memoDate ELSE NULL END) AS memoDate9,
			MAX(CASE WHEN M.memoDate LIKE '${year}-10%' THEN M.memoDate ELSE NULL END) AS memoDate10,
			MAX(CASE WHEN M.memoDate LIKE '${year}-11%' THEN M.memoDate ELSE NULL END) AS memoDate11,
			MAX(CASE WHEN M.memoDate LIKE '${year}-12%' THEN M.memoDate ELSE NULL END) AS memoDate12
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
			WHERE M.boardId = 6
			<if test="bldgId != 0">
				AND M.bldgId = #{bldgId}
			</if>
			GROUP BY M.id
			</script>
			""")
	List<Memo> getMemoExpenses(int bldgId, Integer year);

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
