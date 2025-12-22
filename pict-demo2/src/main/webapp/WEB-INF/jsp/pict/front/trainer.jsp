<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="./include/head.jsp" %>
<%@ include file="./include/header.jsp" %>

<main class="wellness-main">
    <section class="page-header">
        <div class="page-header-container">
            <h1 class="page-title" data-aos="fade-up">강사소개</h1>
            <p class="page-subtitle" data-aos="fade-up" data-aos-delay="100">전문 강사와 함께하는 맞춤 트레이닝</p>
        </div>
    </section>

    <section class="trainers-section">
        <div class="trainers-container">
            <div class="trainer-card" data-aos="fade-up" data-aos-delay="100">
                <div class="trainer-card-header">
                    <div class="trainer-image">
                        <img src="/front_img/yun3.webp" alt="윤수환 대표">
                    </div>
                    <div class="trainer-basic-info">
                        <h3>윤수환 <span>대표</span></h3>
                        <div class="trainer-hashtags">
                            <span class="hashtag">#체형교정전문가</span>
                            <span class="hashtag">#신경계밸런스트레이닝</span>
                            <span class="hashtag">#프리미엄재활PT</span>
                            <span class="hashtag">#지속가능한건강관리</span>
                        </div>
                        <p class="trainer-specialty">체형교정전문가 / 신경계밸런스트레이닝 / 프리미엄재활PT / 지속가능한건강관리</p>
                        <div class="trainer-details">
                            <div class="trainer-section">
                                <h4>강점 및 특징</h4>
                                <ul>
                                    <li>✓ <strong>체형교정&신경계 조화 전문가</strong><br>: 단순한 운동이 아닌, 몸의 균형과 기능 개선에 집중</li>
                                    <li>✓ <strong>강한 열정과 헌신</strong><br>: 허리 통증 극복 경험을 바탕으로 체형 교정에 대한 확신과 연구 지속</li>
                                    <li>✓ <strong>명확한 소통 방식</strong><br>: 논리적이고 명확한 조언으로 신뢰 형성</li>
                                    <li>✓ <strong>창의적인 트레이닝 방식</strong><br>: 기존의 정형화된 방식이 아니라, 새로운 운동법과 동작을 적용하여 재미있는 트레이닝 스타일</li>
                                    <li>✓ <strong>PT+교정&재활까지</strong><br>: 신체 불균형 개선과 기능 회복을 돕는 맞춤형 접근</li>
                                    <li>✓ <strong>목표 지향적인 마인드</strong><br>: 회원님들이 원하는 목표까지 도달하기 위해 끊임없는 노력</li>
                                    <li>✓ <strong>자신만의 철학과 스타일</strong><br>: 트렌드가 아닌, 경험을 바탕으로 독자적인 교정법 구축</li>
                                    <li>✓ <strong>지속 가능한 운동</strong><br>: 단순한 다이어트가 아니라 몸을 더 건강하고 균형있게 만드는 접근법을 제공</li>
                                </ul>
                            </div>

                            <div class="trainer-section">
                                <h4>학력</h4>
                                <ul>
                                    <li>• 한림대학교 컴퓨터공학, 체육학 전공</li>
                                    <li>• FIFA 국제축구연맹 스포츠의학 학위과정</li>
                                </ul>
                            </div>

                            <div class="trainer-section">
                                <h4>경력</h4>
                                <ul>
                                    <li>• 현) 바디블룸 대표</li>
                                    <li>• 현) 노인복지관 홈트레이닝 강사</li>
                                    <li>• 현) 춘천남부노인복지관 운동 처방 상담 전문 상담위원</li>
                                    <li>• 현) 나다운학교 신체 재활 및 몸의 주도성을 위한 운동프로그램 강사</li>
                                    <li>• 전) 한림대학교 커뮤니티교육원 퍼스널트레이닝 강사</li>
                                    <li>• 전) 평생학습 찾아가는 방문강좌 요가&스트레칭 강사</li>
                                    <li>• 전) 숲체험 교육 프로그램 스트레칭 강사</li>
                                    <li>• 가산초등학교 학부모 교육_아이의 교정과 성장 강의</li>
                                    <li>• 나다운학교 학부모 교육_자세와 신경계 강의</li>
                                </ul>
                            </div>

                            <div class="trainer-section">
                                <h4>수상 및 기타 이력</h4>
                                <ul>
                                    <li>• 한림대학교 실감형 교육 콘텐츠 개발 자문 위원</li>
                                    <li>• 근막이완기구 제품 개발 참여_브랜드 제품사업화 지원사업 수행기업</li>
                                </ul>
                            </div>

                            <div class="trainer-section">
                                <h4>자격사항</h4>
                                <ul>
                                    <li>• 생활스포츠지도사 2급(보디빌딩)_문화체육관광부장관</li>
                                    <li>• The NASM International Certificate in Personal Training(CPT) (미국스포츠의학회 공인 트레이너)_NASM</li>
                                    <li>• Corrective Exercise Specialist(CES)(교정운동사)_NASM</li>
                                    <li>• Barefoot Training Specialist Level 1_NASM</li>
                                    <li>• Barefoot Training Specialist Level 2_NASM</li>
                                    <li>• Certified Measurement & Evaluation Specialist(MES)(측정평가사)_FITT</li>
                                    <li>• PRES™ Soft Tissue mobilization Technique (프리스팀 마사지)_대한예방운동협회</li>
                                    <li>• 스포츠 마사지 2급_(사)한국선수트레이너협회</li>
                                    <li>• 스포츠 영양 코치_NSCA</li>
                                    <li>• FIFA Diploma in Football Medicine_FIFA</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="trainer-card reverse" data-aos="fade-up" data-aos-delay="200">
                <div class="trainer-card-header">
                    <div class="trainer-image">
                        <img src="/front_img/choi.webp" alt="최재희 실장">
                    </div>
                    <div class="trainer-basic-info">
                        <h3>최재희 <span>실장</span></h3>
                        <div class="trainer-hashtags">
                            <span class="hashtag">#퍼포먼스트레이너</span>
                            <span class="hashtag">#재활경험기반지도</span>
                            <span class="hashtag">#전문적인맞춤형코칭</span>
                            <span class="hashtag">#안정적트레이닝환경</span>
                        </div>
                        <p class="trainer-specialty">퍼포먼스트레이너 / 재활경험기반지도 / 전문적인맞춤형코칭 / 안정적트레이닝환경</p>
                        <div class="trainer-details">
                            <div class="trainer-section">
                                <h4>강점 및 특징</h4>
                                <ul>
                                    <li>✓ <strong>퍼포먼스 트레이닝 전문가</strong><br>: 하키 선수 출신으로 운동 수행 능력 및 퍼포먼스 향상 트레이닝 강점</li>
                                    <li>✓ <strong>다양한 현장 경험</strong><br>: 여러 헬스장에서 쌓은 폭넓은 트레이닝 스타일</li>
                                    <li>✓ <strong>웨이트 트레이닝 깊은 이해</strong><br>: 직접 마른체형을 극복한 경험으로 실질적인 솔루션 제공 가능</li>
                                    <li>✓ <strong>체형 교정&재활 공감력</strong><br>: 허리 디스크, 인대 재건 수술 등 여러 수술 경험을 바탕으로 부상 관리 및 재활 지도에 강점</li>
                                    <li>✓ <strong>사려 깊고 배려심 있는 코칭</strong><br>: 회원의 고민을 잘 들어주고 편안한 운동 환경 조성</li>
                                    <li>✓ <strong>회원 맞춤형 트레이닝</strong><br>: 개개인의 니즈를 반영한 섬세한 지도 스타일</li>
                                    <li>✓ <strong>책임감과 성실함</strong><br>: 꾸준하고 체계적인 지도로 신뢰 높은 트레이닝 제공</li>
                                    <li>✓ <strong>선수&일반인 트레이닝 균형</strong><br>: 선수 출신이지만 트레이너 경험도 풍부해 맞춤형 접근 가능</li>
                                </ul>
                            </div>

                            <div class="trainer-section">
                                <h4>학력</h4>
                                <ul>
                                    <li>• 강원대학교 스포츠학과 전공</li>
                                    <li>• FIFA 국제축구연맹 스포츠의학 학위과정</li>
                                </ul>
                            </div>

                            <div class="trainer-section">
                                <h4>경력</h4>
                                <ul>
                                    <li>• 현) 바디블룸 실장</li>
                                    <li>• 현) 춘천남부노인복지관 홈트레이닝 강사</li>
                                    <li>• 현) 월드비전복지관 트레이닝 강사</li>
                                    <li>• 전) 필드하키 선수</li>
                                    <li>• 전) 강원대학교 백령스포츠센터/트레이닝 강사 & GX강사_아침을 여는 스트레칭</li>
                                    <li>• 전) body20 studio/트레이너</li>
                                    <li>• 전) 파리피트니스/팀장</li>
                                    <li>• 전) 국민건강보험공단/대리</li>
                                    <li>• 전) 느린소리(경계지능 초등부) 놀이체육 강사</li>
                                    <li>• 전) 평생학습 찾아가는 방문강좌 요가&스트레칭 강사</li>
                                    <li>• 다문화가정 방문교사 대상 일일강의_스트레스 해소&스트레칭 방법</li>
                                </ul>
                            </div>

                            <div class="trainer-section">
                                <h4>수상 및 기타 이력</h4>
                                <ul>
                                    <li>• 전국 종별 필드하키 선수권 대회 우수선수상</li>
                                    <li>• 대통령배 전국 필드하키 선수권 대회 최우수선수상</li>
                                    <li>• 상비군 발탁</li>
                                    <li>• 춘천시 생활대축전 뷰티바디 2위</li>
                                    <li>• 근막이완기구 제품 개발 참여_브랜드 제품사업화 지원사업 수행기업</li>
                                </ul>
                            </div>

                            <div class="trainer-section">
                                <h4>자격사항</h4>
                                <ul>
                                    <li>• 생활스포츠지도자 2급(보디빌딩)_문화체육관광부장관</li>
                                    <li>• 노인스포츠지도자(보디빌딩)_문화체육관광부장관</li>
                                    <li>• 국제퍼스널트레이너_FISAF KOREA</li>
                                    <li>• 국제 메디컬 트레이너_FISAF KOREA</li>
                                    <li>• 바른자세 교육사 2급_바른자세헬스케어진흥원</li>
                                    <li>• 재활운동처방사 2급_바른자세헬스케어진흥원</li>
                                    <li>• 국제 인증 체형평가 분석사_움직임 과학 연구소</li>
                                    <li>• Safety Guard(CPR&AED)_YMCA시민안전본부</li>
                                    <li>• BOSU MIND-BODY CERTIFICATION_BOSU</li>
                                    <li>• 산후관리사 1급_한국자격검정평가진흥원</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="trainer-card" data-aos="fade-up" data-aos-delay="300">
                <div class="trainer-card-header">
                    <div class="trainer-image">
                        <img src="/front_img/dw.webp" alt="윤동욱 강사">
                    </div>
                    <div class="trainer-basic-info">
                        <h3>윤동욱 <span>강사</span></h3>
                        <div class="trainer-hashtags">
                            <span class="hashtag">#운동생리학전문트레이너</span>
                            <span class="hashtag">#고객맞춤형지도</span>
                            <span class="hashtag">#청소년전문트레이닝</span>
                            <span class="hashtag">#다이어트프로그램</span>
                        </div>
                        <p class="trainer-specialty">운동생리학전문트레이너 / 고객맞춤형지도 / 청소년전문트레이닝 / 다이어트프로그램</p>
                        <div class="trainer-details">
                            <div class="trainer-section">
                                <h4>강점 및 특징</h4>
                                <ul>
                                    <li>✓ <strong>고객 맞춤형 트레이닝</strong><br>: 개인별 니즈를 정확히 파악하고 만족도를 높이는 지도 스타일</li>
                                    <li>✓ <strong>스타일과 신체 조화를 완성하는 트레이닝</strong><br>: 단순한 운동이 아닌, 외적 이미지 개선까지 고려한 접근</li>
                                    <li>✓ <strong>아이들과의 소통 능력</strong><br>: 중학교 스포츠 강사 경험을 바탕으로 유아, 청소년 트레이닝 최적화</li>
                                    <li>✓ <strong>높은 메타인지 능력</strong><br>: 객관적 분석과 피드백 수용력이 뛰어나 효과적인 지도 제공</li>
                                    <li>✓ <strong>운동생리학 석사</strong><br>: 학문적 지식과 실전 경험을 겸비한 체계적인 트레이닝</li>
                                    <li>✓ <strong>다이어트 전문 트레이너</strong><br>: 체중 감량 목표 회원들에게 최적화된 프로그램 제공</li>
                                    <li>✓ <strong>강한 리더십과 추진력</strong><br>: 목표 지향적이고 동기부여를 효과적으로 유도하는 스타일</li>
                                </ul>
                            </div>

                            <div class="trainer-section">
                                <h4>학력</h4>
                                <ul>
                                    <li>• 한림대학교 스포츠 의학 전공</li>
                                    <li>• 강원대학교 스포츠과학 운동생리학 석사</li>
                                    <li>• FIFA 국제축구연맹 스포츠의학 학위과정</li>
                                </ul>
                            </div>

                            <div class="trainer-section">
                                <h4>경력</h4>
                                <ul>
                                    <li>• 현) 바디블룸 강사</li>
                                    <li>• 현) 중학교 스포츠 강사</li>
                                    <li>• 현) 평생교육관 체형교정&다이어트 강사</li>
                                    <li>• 전) FIA KOREA 전임 운동생리학 강사</li>
                                    <li>  - 필라테스 다이어트 방법론 강의</li>
                                    <li>  - 다이어트 식단 설계 강의</li>
                                    <li>  - 생리학적 다이어트 방법론 강의 외 다수</li>
                                </ul>
                            </div>

                            <div class="trainer-section">
                                <h4>수상 및 기타 이력</h4>
                                <ul>
                                    <li>• 미스터 서울(60kg) 4위</li>
                                    <li>• PCA춘천 보디빌딩, 스포츠 모델 4위</li>
                                    <li>• 여성 비만운동, 보충제와 다이어트 논문 저자</li>
                                </ul>
                            </div>

                            <div class="trainer-section">
                                <h4>자격사항</h4>
                                <ul>
                                    <li>• 생활체육지도자 2급(보디빌딩)_문화체육관광부장관</li>
                                    <li>• The NASM International Certificate in Personal Training(CPT)(미국스포츠의학회 공인 트레이너)_NASM</li>
                                    <li>• Corrective Exercise Specialist(CES)(교정운동사)_NASM</li>
                                    <li>• Performance Enhancement Specialist(PES)(선수트레이닝전문가)_NASM</li>
                                    <li>• 스포츠 영양전문가_NSCA(미국스트렝스컨디셔닝 학회)</li>
                                    <li>• 노인스포츠지도자(보디빌딩)_문화체육관광부장관</li>
                                    <li>• 국제비만운동전문가(OWMES) 한국 마스터 트레이너</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="trainer-card" data-aos="fade-up" data-aos-delay="300">
                <div class="trainer-card-header">
                    <div class="trainer-image">
                        <img src="/front_img/no.webp" alt="노을 이사">
                    </div>
                    <div class="trainer-basic-info">
                        <h3>노을 <span>운영•관리 이사</span></h3>
                        <div class="trainer-hashtags">
                            <span class="hashtag">#만능엔터테이너</span>
                            <span class="hashtag">#바디블룸실세</span>
                            <span class="hashtag">#온화한미소</span>
                        </div>
                        <div class="trainer-details">
                            <div class="trainer-section">
                                <h4>담당업무</h4>
                                <ul>
                                    <li>✓ <strong>피트니스 카페 운영</strong></li>
                                    <li>✓ <strong>세무•회계 관리</strong></li>
                                    <li>✓ <strong>전반적인 센터 관리</strong></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="trainer-card" data-aos="fade-up" data-aos-delay="300">
                <div class="trainer-card-header">
                    <div class="trainer-image">
                        <img src="/front_img/ji.webp" alt="을지">
                    </div>
                    <div class="trainer-basic-info">
                        <h3>을지 <span>웰컴매니저</span></h3>
                        <div class="trainer-hashtags">
                            <span class="hashtag">#우주최강귀여움</span>
                            <span class="hashtag">#바디블룸간판</span>
                            <span class="hashtag">#행복전도사</span>
                        </div>
                        <div class="trainer-details">
                            <div class="trainer-section">
                                <h4>담당업무</h4>
                                <ul>
                                    <li>✓ <strong>인사•정서교감•회복 담당</strong></li>
                                    <li>✓ <strong>말 없는 귀염둥이 치료사 포지션</strong></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
</main>

<script>
$(document).ready(function() {
    AOS.init({
        duration: 800,
        easing: 'ease-in-out',
        once: true
    });
});
</script>

<%@ include file="./include/footer.jsp" %>
