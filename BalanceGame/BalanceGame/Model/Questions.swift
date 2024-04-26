//
//  BalanceGameModel.swift
//  BalanceGame
//
//  Created by beaunexMacBook on 4/26/24.
//

import Foundation

enum Questions {
    static let foodQuestions = 
    [
        "이사하는 날에 짜장면",
        "비 오는 날에 파전",
        "탄산 없는 콜라",
        "치즈 없는 피자",
        "김치 없이 라면",
        "치킨무 없이 치킨",
        "물렁 복숭아",
        "딱딱 복숭아",
        "삼겹살에 소주",
        "곱창에 소주",
        "후라이드 치킨",
        "양념 치킨",
        "파인애플 피자",
        "민트 초코",
        "물냉면",
        "비빔냉면",
        "코카콜라",
        "펩시콜라",
        "쌀떡볶이",
        "김치찌개",
        "된장찌개",
        "탕수육",
        "보쌈",
        "초밥",
        "삼각김밥",
        "햄버거",
        "계란후라이",
        "부대찌개",
        "매운탕",
        "허니콤보(치킨)",
        "만두",
        "닭볶음탕"
    ]
    
    static let loveQuestions =     
    [
        "애인과 평생 스킨십 못함",
        "애인과 평생 말 못함",
        "키스 5분",
        "뽀뽀 무제한",
        "군대 재입대",
        "머리카락 빼고 다 있는 애인",
        "지식과 돈이 없는 애인",
        "내게 관심 없는 방목형 애인",
        "내게 관심 많은 집착형 애인",
        "엄마 앞에서 애인과 키스",
        "애인 앞에서 이성친구와 뽀뽀",
        "매일 사랑해 듣기",
        "한 달에 한 번 갖고 싶은 선물",
        "하루에 백 번 통화",
        "한 달에 한 번 통화",
        "코털 긴 애인",
        "대머리가 된 애인",
        "말 이해 못해서 되묻는 애인",
        "드립 이해 못하는 애인",
        "인터넷 기록 공개",
        "메신저 기록 공개",
        "단톡방에서 공개 고백",
        "길거리에서 공개 고백",
        "식사 때 쩝쩝거리는 애인",
        "식사 때 흘리면서 먹는 애인",
        "입냄새 심한 애인",
        "착한데 재미없는 애인",
        "내 과거를 알고 싶어 하는 애인",
        "못생겼지만 한달에 천만원 버는 애인",
        "잘생겼지만 아무것도 없는 애인",
        "내가 더 사랑하는 사람",
        "나를 더 사랑하는 사람"
    ]

    static let situationQuestions =    
    [
        "이틀 굶기",
        "이틀 밤새기",
        "토맛 토마토",
        "토마토맛 토",
        "똥에서 진주가 나오는 능력",
        "방귀로 사람 기절시키는 능력",
        "모르는 사람 앞에서 발가벗기",
        "아는 사람 앞에서 발가벗고 노래 부르기",
        "평생 여드름",
        "평생 탈모",
        "여름에 겨울 옷입기",
        "회에 딸기쨈먹기",
        "똥 안 먹었는데 먹었다는 소문나기",
        "똥 진짜 먹고 아무도 모르기",
        "한 여름에 패딩입기",
        "삼겹살에 메이플 시럽 먹기",
        "이어폰 한쪽 잃어버리기(평생 한쪽으로만 들어야함)",
        "폰 액정 완전히 부서지기(수리X)",
        "평생 게임 못하기",
        "대표님과 단 둘이 김밥천국 식사하기",
        "일주일동안 쑥만 먹기",
        "직장,학교 통학 4시간하기",
        "스윙스에게 500만원 주기",
        "나 같은 자식 낳기",
        "화장실 갈때마다 화장지 없기(큰거)",
        "평생 불편하게 자기(앉아서)",
        "평생 허리디스크로 살기",
        "평생 목디스크로 살기",
        "사람 30명있는데서 방구 큰소리로 뀌기",
        "평생 젖꼭지 한 개로 살기",
        "길거리 제로투추면서 이동하기",
        "한 여름 모기 500군데 물리기"
    ]

    static let friendQuestions =    
    [
        "친한 친구랑 손절하기",
        "회 못 먹는 친구랑 바닷가 놀러가기",
        "노래 안하는 친구랑 노래방 가기",
        "술자리 절대 못가는 친구",
        "카페 절대 안가는 친구",
        "365일 화나 있는 친구",
        "365일 슬퍼하는 친구",
        "내 짱친이랑 내 애인 둘이 만나서 놀기",
        "베프 씻겨주기",
        "베프한테 씻김당하기",
        "1년 동안 베프 없이 살기",
        "친구랑 매일 3시간 통화하기",
        "친구들 앞에서 친구랑 뽀뽀하고 300만원 받기",
        "감성카페에서 사진 천장 찍어달라 하는 친구",
        "친구 몸무게 20KG 받아오기",
        "로또 1등 당첨했을 때 친구한테 90% 주기",
        "엘베에서 사람 20명 타 있는데 똥 지린 친구",
        "도박으로 인해 돈 빌려 달라하는 친구",
        "친구랑 놀 때마다 손잡고 다니기",
        "친구랑 맨날 카톡하기 10분에 한번씩",
        "친구한테 비밀 5개 털어놓기",
        "친구 집 바퀴벌레 잡아주기",
        "멍청한 친구",
        "친구랑 우정타투하기",
        "무인도에서 친구랑 1년 버티기",
        "아마존에서 친구랑 1년 버티기",
        "남극에서 친구랑 1년 버티기",
        "10일 안감은 친구 머리 감겨주기",
        "친한 친구와 손절하기",
        "똑똑하지만 싸가지 없는 친구",
        "친구들 앞에서 친구와 키스하기 (1억 받음)",
        "친구 양치시켜주기"
    ]
    
    static let officeWorkerQuestions =
    [
        "나 빼고 다 천재인 팀에서 숨쉬듯 자괴감 느끼기",
        "내가 유일한 희망인 팀에서 혼자 밭 가는 소처럼 일하기",
        "회의하는 3시간 동안 상사가 말하는 것만 듣기",
        "회의하는 3시간 동안 혼자만 끊임없이 말하기",
        "일 잘하는데 성격 거지같은 상사랑 일하기",
        "일 못하는데 성격 좋은 상사랑 일하기",
        "연차 썼는데 1시간에 한번씩 전화오기",
        "퇴근 10분 전 업무 받아서 야근하기",
        "지나치게 간섭하는 사수랑 일하기",
        "아무것도 안 알려주는 사수랑 일하기",
        "눈치 없고 일 못하지만 나이어린 신입",
        "경력 많고 일 잘하지만 나이 많은 신입",
        "동성 동료가 많은 직장 다니기",
        "이성 동료가 많은 직장 다니기",
        "시켜야만 일 하는 사람이랑 일하기",
        "시킨 일도 하고 쓸때 없는 일도 만드는 사람이랑 일하기",
        "일주일에 세 번 이상 회식하자고 하는 직장에서 일하기",
        "일주일에 세 번 이상 야근하라고 하는 직장에서 일하기",
        "7시 출근해서 10시 퇴근",
        "상사에게 게임 초대 문자 잘못 보내기(새벽2시)",
        "동료에게 보낼 뒷담화 상사에게 잘못 보내기",
        "안주는 김뿐인 절친과의 술자리",
        "내돈내산 밥버거 먹는 1시간 점심 회식",
        "돈 많이 주는 하기 싫은 일하기",
        "돈 적게 주는 하고 싶은 일하기",
        "성과 가로채는 동료랑 일하기",
        "상사랑 단 둘이 멜로영화보기",
        "상사 머리감겨주기",
        "편도 1시간 반 거리 환승5번 출퇴근하기",
        "10분마다 방구끼는 옆자리 동료랑 같이 일하기",
        "상사와 방탈출하기",
        "휴가 눈치 주는 상사"
    ]
    
    static let polarOppositesQuestions =
    [
        "요플레 뚜껑 그냥 버리기",
        "쭈쭈바 꼬다리 그냥 버리기",
        "평생 떡만 먹기",
        "친구 없이 살기",
        "1년 동안 핸드폰 없이 살기",
        "노래 안하는 친구랑 노래방 가기",
        "평생동안 샤워 안하기",
        "평생동안 양치 안하기",
        "키 2m 50cm로 살기",
        "무인도에서 평생 혼자 살기",
        "길가에서 대변 보고 5억 받기",
        "잘 때 모기가 귀에서 앵앵거리기",
        "팔만대장경 끝까지 읽기",
        "사생활 노출 당하기",
        "스윙칩 삼시세끼 8달 먹기",
        "점돌이로 개명하기",
        "하루에 세번 문틈에 발 찧기",
        "좋아하는 사람한테 고백하려는데 트름하기",
        "떨어진 음식 먹다 썸남,썸녀한테 걸리기",
        "똥 쌀 때 휴지 하나 다 쓰는 애인과 결혼",
        "평생 밥과 김치만 먹고 살기",
        "평생 치질걸려 살기",
        "평생 기어다니기",
        "평생 뒤로만 걷기",
        "5억 받고 얼굴 랜덤 돌리기",
        "하루0.5끼씩 평생 먹기",
        "연애 할 때마다 잠수이별 당하기",
        "비 오는 날 항상 양말 젖기",
        "주기적으로 하루에 1시간씩 발바닥 간지럽힘 당하기",
        "바퀴벌레와 30마리와 동침하기",
        "평생 장염걸려 살기",
        "30년 동안 매일 같은 옷 입기"
    ]
}


