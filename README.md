# 주택 자가관리 프로젝트

- 프로젝트 시작 배경

다가구 임대 및 건물관리는 일반적으로 관리업체나 개인이 주로 엑셀을 이용하여 처리하고 있으나, 이로 인해 다수의 어려움이 발생한다. 따라서 이러한 어려움을 해소하고자 프로그램으로 구현함으로써 편리한 해결책을 제시하고자 본 프로젝트를 시작했다.

#동일한 데이터를 임대현황, 관리비고지서, 사업장현황신고(세금) 등에 수기로 반복해 작성하는 점 <br>
#고지서를 파일로 저장하거나 프린트할 때 엑셀의 레이아웃의 아쉬움<br>
#계약만료일 3개월 전 알람, 세입자 메모 등 놓칠 수 있는 관리에 대한 시스템 부족<br>
#엑셀을 사용하지 못하는 경우 업체에 맡기는 데, 이때 소요되는 비용과 시간으로 수익반감 등등<br>


- 시장조사

기존 어플 기능: 임대파악, 세입자연결, 부동산연결, 아파트 시세파악, 세입자 정보 입력, 매물정보 <br>
건물관리에 필요기능: 세금신고서 작성, 관리비 고지서 출력, 건물보수작업 메모, 작업비용 영수증 첨부 등 <br>
→ 즉, 건물관리에 특화된 어플은 없는 실정

 - 프로젝트 목표 : 다가구 주택의 개인관리화

본 프로젝트는 건물관리에 특화된 새로운 분야의 서비스를 창조하고 제공하는 것을 목표로 삼으며, 시작 단계로 다가구 주택의 개인 관리를 전문화하는 데 중점을 둔다. 이를 토대로, 다가구 주택부터 시작하여 상가 등과 같은 대규모 건물의 효율적인 관리를 위한 프로그램으로 발전시킬 계획임. 더불어, 개인관리뿐만 아니라 건물관리업체도 활용할 수 있는 프로그램으로 발전시켜, 다양한 규모와 유형의 건물에 대한 효과적인 관리를 지원할 예정.


![image](https://github.com/yhwit30/demo_project_2024_1/assets/153142837/d9874464-8c31-4afc-8e3c-e41f409fb7e7)
![image](https://github.com/yhwit30/demo_project_2024_1/assets/153142837/ad53ff27-b449-45d6-a9b8-e35f533692cd)
![image](https://github.com/yhwit30/demo_project_2024_1/assets/153142837/0ebe1005-0586-4427-bc46-db66cd60ba62)



<br><br>
## 기능

- 대쉬보드
    - 건물별 수익률 분석
    - 건물 위치 기준 날씨 api 불러오기
    - 건물별 입주율 도넛그래프
- 수납관리
    - 세입자 납부날짜 입력, 수정, 삭제 ajax
    - 납부날짜 입력 시 ‘사업장 현황신고’에 해당 월에 데이터 연동
    - 현재날짜 속한 월 빨간줄로 하이라이트
    - 계약기간 배경 하이라이트
    - 계약만료일 3개월 전부터 배경 다른 색으로 하이라이트
    - 계약기간에 속하는 연도만 select 범위에 나오도록 ajax
- 관리비
    - 입력 한 열을 한번에 하는 기능
    - 세입자별 관리비 재설정 기능 버튼 ajax
    - 관리비 전체 수정하도록 구현(배열 사용)
    - 세입자별 관리비 고지서 pdf 또는 csv 출력 기능
- 건물정보
    - 건물 추가 시 주소 찾기 api 구현
    - 건물 세대수에 맞게 세입자 추가할 수 있도록 범위 설정 ajax
    - 각 건물별 수정, 삭제 기능
    - 건물별 위치 주소 지도로 보여주는 api
- 계약정보
    - 각 세입자별 수정, 삭제 기능
    - 세입자 전체 수정, 삭제 기능
    - 계약 추가 시 세입자 정보와 계약 정보 데이터베이스를 분리해서 저장
    - 계약 정보 수정, 삭제 시 다른 페이지에도 연동
- 세입자정보
    - 각 세입자별 수정, 삭제 기능
    - 세입자 전체 수정, 삭제 기능
- 작업일지
    - 목록 보기, 추가, 수정, 삭제 (CRUD)
- 지출내역
    - 추가 시 모달창으로 건물, 호실 선택
    - 추가 시 지출연월은 달력ui datepicker 라이브러리 사용
    - 추가완료 시 해당 월에 새로운 행 생성 및 하이라이트 ajax
- 사업장 현황신고
    - 수납관리에 입력된 월에 보증금과 월세 데이터 보이도록 연동
    - pdf 또는 csv 파일로 신고서 출력 기능
- 회원
    - 로그인, 로그아웃, 아이디 찾기, 비밀번호 찾기, 회원가입, 회원정보수정