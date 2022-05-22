$(() => {
    // 1. 이벤트 연결
    // 1) on()와 off()
    // $('#area1').on('mouseenter', () => {
    //     $('#area1').css('background', 'beige').text('마우스가 올라감');
    // });
    
    // $('#area1').on('mouseleave', () => {
    //     $(window.event.target).css('background', 'hotpink').text('마우스가 내려감');
    // });

    // $('#area1').on('mouseenter mouseleave', (event) => {
    //     console.log(event);

    //     if(event.type === 'mouseenter') {
    //         $('#area1').css('background', 'beige').text('마우스가 올라감');
    //     } else if(event.type === 'mouseleave') {
    //         $(event.target).css('background', 'hotpink').text('마우스가 내려감');
    //     }
    // });

    // $('#area1').on('click', (event) => {
    //     $(event.target)
    //             .css('background', 'white')
    //             .text('')
    //             .off('mouseenter mouseleave');
    //             // .off('mouseleave');
    // });

    $('#area1').on({
        mouseenter: () => {
            $('#area1').css('background', 'beige').text('마우스가 올라감');
        },
        mouseleave: () => {
            $(window.event.target).css('background', 'hotpink').text('마우스가 내려감');
        },
        click: (event) => {
            $(event.target).css('background', 'white').text('').off('mouseenter mouseleave');
        }
    });

    // 2) one()
    $('#area2').one('click', () => {
        alert('처음이자 마지막으로 이벤트 핸들러 실행');
    }).css('cursor', 'pointer');

    // 2. 키보드 이벤트
    // 1) keydown(), keypress(), keyup()
    $('#tarea1').on({
        // 키보드가 눌려질 때
        keydown: (event) => {
            console.log(`keydown > event.key : ${event.key}, event.keycode : ${event.keyCode}`);
        },
        // 글자가 입력될 때 (한글, 펑션키, 기능키 사용못함)
        keypress: (event) => {
            console.log(`keypress > event.key : ${event.key}, event.keycode : ${event.keyCode}`);
        }, 
        // 키보드가 떼어질 때
        keyup: (event) => {
            console.log(`keyup > event.key : ${event.key}, event.keycode : ${event.keyCode}`);
        }
    });

    // 2) 동적으로 글자 수 세기
    $('#tarea2').on('keyup', (event) => {
        let target = $(event.target);
        let counter = $('#counter');
        let maxLength = parseInt($('#maxLength').text());
        
        if((maxLength - target.val().length) < 0) {
            // counter.css('color', 'red');

            target.val(target.val().substr(0, maxLength));
        } else {
            counter.css('color', 'black');
        }

        console.log(target.val().length);
        counter.text(target.val().length);
    });

    // 3) 동적으로 아이디 조건 확인
    let regExp = /^[a-z][a-z\d]{3,11}$/;

    $('#userId').keyup((event) => {
        let userId = $(event.target).val();

        if(userId === null || userId === '') {
            $('#idCheck').css({'color': 'white'}).text('');
        } else if(regExp.test(userId)) {
            $('#idCheck').css({'color': 'green', 'font-weight': 'bold'}).text('사용 가능한 아이디 형식입니다.');
        } else {
            $('#idCheck').css({'color': 'red', 'font-weight': 'bold'}).text('사용 할 수 없는 아이디 형식입니다.');
        }
    });
});
