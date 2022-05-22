$(document).ready(() => {
    // 1 Content 관련 메소드

    //  1) html() 메소드
    // content 영역의 태그와 텍스트를 모두 가져온다.
    console.log(`$('#content1').html() : ${$('#content1').html()}`); 
    
    $('#content2').html($('#content1').html());
    
    $('#content2').children('a').attr('href', 'https://www.naver.com');
    
    console.log(`$('.content').html() : ${$('.content').html()}`); 
    
    $('.content').html((index, content) => {
        console.log(index, content);

        return `<h1>인덱스 ${index}, 내용 :  ${content}</h1>`;
    });

    // $('.content').html('ㅋㅋㅋㅋㅋㅋㅋ');

    //  2) text() 메소드
    console.log(`$('#content3').text() : ${$('#content3').text()}`); 

    $('#content4').text($('#content3').text());

    // $('#content4').text('<b>안녕</b>');

    console.log(`$('.content2').text() : ${$('.content2').text()}`);

    $('.content2').text((index, content) => {
        console.log(index, content);

        return `<h1>인덱스 ${index}, 내용 :  ${content}</h1>`;
    })

    // 2. 요소 생성 및 제거 메소드
    //  1) 요소 생성
    //  문자열로 요소를 생성하는 방법
    let p1 = '<p>문자열로 요소를 생성</p>';

    //  자바 스크립트 DOM 메소드로 요소를 생성하는 방법
    let p2 = document.createElement('p');
    let textNode = document.createTextNode('DOM 메소드로 요소를 생성');

    p2.appendChild(textNode);

    // jQuery로 요소를 생성하는 방법 1
    let p3 = $('<p>').text('jQuery로 요소를 생성 1');

    // jQuery로 요소를 생성하는 방법 2
    let p4 = $('<p>jQuery로 요소를 생성 2</p>');

    console.dir(p1);
    console.dir(p2);
    console.dir(p3);
    console.dir(p4);

    $('#area1').append(p1, p2, p3, p4);

    // 2-1) 요소 추가 1
    // $(A).append(B) : A 요소의 자식 요소로 B 요소를 뒷부분에 추가한다.
    $('#add1').append('<span>B</span>');
    
    // $(A).prepend(B) : A 요소의 자식 요소로 B 요소를 앞부분에 추가한다.
    $('#add2').prepend('<span>B</span>');

    // $(A).after(B) : A 요소의 형제 요소로 B 요소를 뒷부분에 추가한다.
    $('#add3').after('<span>B</span>');
    
    // $(A).before(B) : A 요소의 형제 요소로 B 요소를 앞부분에 추가한다.
    $('#add4').before('<span>B</span>');

    // 2-2) 요소 추가 2
    // $(A).appendTo(B) : A 요소를 B 요소의 자식 요소로 뒷부분에 추가한다.
    $('<span>B</span>').appendTo('#add5');
    
    // $(A).prependTo(B) : A 요소를 B 요소의 자식 요소로 앞부분에 추가한다.
    $('<span>B</span>').prependTo($('#add6'));

    // $(A).insertAfter(B) : A 요소를 B 요소의 형제 요소로 뒷부분에 추가한다.
    $('<span>B</span>').insertAfter($('#add7'));
    
    // $(A).insertBefore(B) : A 요소를 B 요소의 형제 요소로 앞부분에 추가한다.
    $('<span>B</span>').insertBefore('#add8');

    // 3. 요소 복제 메소드
    // 복제할 요소에 이벤트 추가
    $('#item1').hover(
        // () => {
        //     // 선택된 요소에 클래스 속성값을 추가하는 메소드
        //     $('#item1').addClass('bg-hotpink');
        // }, 
        // () => {
        //     // 선택된 요소에 클래스 속성값을 제거하는 메소드
        //     $('#item1').removeClass('bg-hotpink');
        // }
        (event) => {
            console.log(event);
            // 선택된 요소에 클래스 속성값을 추가/제거하는 메소드
            $(event.target).toggleClass('bg-hotpink');
        }
    );

    // 버튼 클릭 시 요소를 복제
    $('#btn1').click(() => {
        // 이벤트까지 복제하려면 매개값으로 true를 전달한다. (생략 시 false)
        let copyItem = $('#item1').clone(true);

        $('#clone-result').append(copyItem);

        // $('#item1') 요소의 위치가 이동된다.
        // $('#clone-result').append($('#item1'));
    });

    // 4. 요소 제거 메소드
    // 제거할 요소에 이벤트 추가
    $('#item2').hover(() => {
        $('#item2').toggleClass('bg-hotpink');
    });

    // empty 테스트
    // 요소.empty() : 선택된 요소의 자식 요소들을 제거한다.
    $('#empty').click(() => {
        $('#item2').empty();

        // $('#remove-test').empty();
    });

    // remove 테스트
    // 요소.remove() : 선택된 요소를 제거 후 제거된 요소를 리턴해준다. 단, 리턴되는 요소의 이벤트도 삭제된다.
    $('#remove').click(() => {
        let el = $('#item2').remove();

        console.log(el);

        $('#remove-result').append(el);
    });
    
    // detach 테스트
    // 요소.detach() : 선택된 요소를 제거 후 제거된 요소를 리턴해준다. 단, 리턴되는 요소의 이벤트는 삭제하지 않는다.
    $('#detach').click(() => {
        let el = $('#item2').detach();
        
        console.log(el);
        
        $('#remove-result').append(el);
    });

    // 5. 추가적인 메소드
    // 1) each 메소드
    // 객체 배열 생성
    let output = '';
    let arr = [
        {name: '네이버', link: 'https://www.naver.com'},
        {name: '구글', link: 'https://www.google.com'},
        {name: 'w3school', link: 'https://www.w3schools.com'}
    ];

    // $.each(arr, (index, item) => {
    //     console.log(`index: ${index}, item.name: ${item.name}, item.link: ${item.link}`);

    //     output += `<h4><a href=${item.link}>${item.name}</a></h4>`;
    // });

    $(arr).each((index, item) => {
        console.log(`index: ${index}, item.name: ${item.name}, item.link: ${item.link}`);

        output += `<h4><a href=${item.link}>${item.name}</a></h4>`;
    });

    $('#each-test').html(output);
    // $('#each-test').append(output);

    $('#each-test>h4').each((index, item) => {
        console.log(index, item);

        $(item).addClass('bg-hotpink');
    });

    // 자바스크립트에서도 동일한 기능을 하는 메소드가 추가되었다.
    arr.forEach((item, index, origin) => {
        console.log(item, index, origin);
    });

    // 2) extend 메소드
    let moon = {
        name: '문인수',
        age: 21
    };

    console.log(moon);

    $.extend(moon, {job: '강사'});

    console.log(moon);

    let hong = {
        name: '홍길동',
        hobby: ['음악듣기', '달리기', '국밥먹기']
    }

    let result = $.extend(moon, hong);

    console.log(moon);
    console.log(hong);
    console.log(result);

    // 3) noConflict 메소드
    // $('#ncTest').css('color', 'red');
    let jq = $.noConflict();

    jq('#ncTest').css('color', 'orange');
});