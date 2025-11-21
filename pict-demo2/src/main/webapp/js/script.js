AOS.init();


$(document).ready(function () {
    var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
    if (!isMobile) {
        $(window).on('scroll', function () {
            if ($(window).scrollTop() < 845) {
                $('.thumb').removeClass('off');
            } else {
                $('.thumb').addClass('off');
            }
        });

        var ovf, slider;

        function winResize() {
            if (ovf && slider) {
                ovf.style.top = slider.offsetHeight + 100 + "px";
            }
        }

        $(function() {
            ovf = document.querySelector(".subContents");
            slider = document.querySelector(".subTop");
            if (ovf && slider) {
                winResize();
                $(window).bind({resize: winResize, scroll: winScroll});
            }
        });

        function winScroll() {
            if (ovf && slider) {
                var op = 1 - (window.pageYOffset / slider.offsetHeight);
                slider.style.opacity = op;
            }
        }
    } else {
        $(window).on('scroll', function () {
            if ($(window).scrollTop() < 300) {
                $('.thumb').removeClass('off');
            } else {
                $('.thumb').addClass('off');
            }
        });

        var ovf, slider;

        function winResize() {
            if (ovf && slider) {
                ovf.style.top = slider.offsetHeight + 70 + "px";
            }
        }

        $(function() {
            ovf = document.querySelector(".subContents");
            slider = document.querySelector(".subTop");
            if (ovf && slider) {
                winResize();
                $(window).bind({resize: winResize, scroll: winScroll});
            }
        });

        function winScroll() {
            if (ovf && slider) {
                var op = 1 - (window.pageYOffset / slider.offsetHeight);
                slider.style.opacity = op;
            }
        }
    }
});

//스크롤 엄지
let scrollTop = 0;

$(window).on('scroll', function(){
	
	scrollTop = $(window).scrollTop();
	
	$('.thumb1').css('transform', 'translateX(' + scrollTop * -0.15 + 'px)');
	$('.thumb2').css('transform', 'translateX(' + scrollTop * -0.15 + 'px)');
	$('.thumb3').css('transform', 'translateX(' + scrollTop * 0.15 + 'px)');
	$('.thumb4').css('transform', 'translateX(' + scrollTop * 0.15 + 'px)');
})
	
//h2 스크롤 밑줄
//$(window).scroll(function() {
//	var scroll = $(document).scrollTop();
//	var minusH = $(document).innerHeight() / 10;
//	var target1 = $('.subTitles span').offset().top;//
//	if (scroll > target1 - minusH) {
//		$('.subTitles span').addClass('active');
//	}
//});

//스와이퍼
const swiper1 = new Swiper('.swiper-container', {
    autoplay: {
      delay: 1000,
      disableOnInteraction: false
    },
    pagination: false,
    slidesPerView: "auto",
    spaceBetween: 20,
    loop: true,	// 무한 루프 적용
    speed: 1000,
    breakpoints: {
        0: {
            slidesPerView: 1.7,
        },
        769: {
            slidesPerView: 2.5,  //브라우저가 768보다 클 때
        },
        1025: {
            slidesPerView: 4.7,  //브라우저가 1024보다 클 때
        },
    }
});


// 컨텐츠 로드(더보기)
$(function(){
    // 초기에 10개의 리스트 아이템만 표시
    $(".videoList ul li").slice(0, 12).css('display', 'block');

    // 초기 상태에서 버튼의 표시 여부를 결정
    if ($(".videoList ul li").length <= 12) {
        $(".moreButton button").hide(); // 10개 이하면 버튼 숨기기
    } else {
        $(".moreButton button").show(); // 11개 이상이면 버튼 표시
    }

    // '더보기' 버튼 클릭 이벤트
    $(".moreButton button").click(function(e){
        e.preventDefault();
        // 숨겨진 리스트 아이템 10개 추가 표시
        $(".videoList ul li:hidden").slice(0, 12).css('display', 'block');

        // 더 이상 표시할 아이템이 없으면 버튼 숨기기
        if($(".videoList ul li:hidden").length === 0){
            $(".moreButton button").hide();
        }
    });
});

// 컨텐츠 로드(더보기)
$(function(){
    // 초기에 10개의 리스트 아이템만 표시
    $(".bdLists.boardL li").slice(0, 10).css('display', 'block');

    // 초기 상태에서 버튼의 표시 여부를 결정
    if ($(".bdLists.boardL li").length <= 10) {
        $(".moreButton.bd button").hide(); // 10개 이하면 버튼 숨기기
    } else {
        $(".moreButton.bd button").show(); // 11개 이상이면 버튼 표시
    }

    // '더보기' 버튼 클릭 이벤트
    $(".moreButton.bd button").click(function(e){
        e.preventDefault();
        // 숨겨진 리스트 아이템 10개 추가 표시
        $(".bdLists.boardL li:hidden").slice(0, 10).css('display', 'block');

        // 더 이상 표시할 아이템이 없으면 버튼 숨기기
        if($(".bdLists.boardL li:hidden").length === 0){
            $(".moreButton.bd button").hide();
        }
    });
});


// 컨텐츠 로드(더보기)
$(function(){
    // 초기에 10개의 리스트 아이템만 표시
    $(".bdLists.news li").slice(0, 10).css('display', 'block');

    // 초기 상태에서 버튼의 표시 여부를 결정
    if ($(".bdLists.news li").length <= 10) {
        $(".moreButton.bd.news button").hide(); // 10개 이하면 버튼 숨기기
    } else {
        $(".moreButton.bd.news button").show(); // 11개 이상이면 버튼 표시
    }

    // '더보기' 버튼 클릭 이벤트
    $(".moreButton.bd.news button").click(function(e){
        e.preventDefault();
        // 숨겨진 리스트 아이템 10개 추가 표시
        $(".bdLists.news li:hidden").slice(0, 10).css('display', 'block');

        // 더 이상 표시할 아이템이 없으면 버튼 숨기기
        if($(".bdLists.news li:hidden").length === 0){
            $(".moreButton.bd.news button").hide();
        }
    });
});
