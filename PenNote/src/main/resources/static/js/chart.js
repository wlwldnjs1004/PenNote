$(function () {
     loadChart("pokemon", ".pokemon-chart", "포켓몬 개체 수", "bar");
     loadChart("game-user", ".game-user-chart", "이용자 수", "bar");
     loadChart("board-write", ".board-write-chart", "게시글 수", "bar");
     loadChart("member", ".member-chart", "회원 수");
     loadChart("member-join", ".member-join-chart", "가입자 수");

     //차트데이터를 불러오는 함수
     function loadChart(url, selector, name, type="doughnut") {
         $.ajax({
             url:"/rest/status/"+url,
             method:"get",
             //data: {},
             success:function(response){
                 //response는 key-value 세트형태이므로 key와 value를 각각 분리
                 var keys = [], values= [];
                 for(var i=0; i < response.length; i++) {
                     keys.push(response[i].key);
                     values.push(response[i].value);
                 }

                 //차트 생성 코드
                 createChart(selector, name, keys, values, type);
             },
         });
     }

     //차트를 그리는 함수
     //- selector : 차트를 그려야하는 canvas의 선택자
     //- type : 차트의 유형
     //- name : 차트 데이터 이름(범례)
     //- keys : 차트의 x축 항목명
     //- values : 차트에 표시될 데이터
     function createChart(selector, name, keys, values, type="doughnut") {
         var canvas = document.querySelector(selector);
         new Chart(canvas, {
             type: type,//bar, pie, doughnut, line 
             data: {//차트의 데이터
                 //차트에 표시할 항목 이름(x축)
                 labels: keys,
                 
                 //실제로 차트에 표시될 값 (여러개 설정 가능)
                 datasets: [
                     {
                         label: name,//범례
                         data: values,//수치
                         borderWidth: 1//테두리 두께(디자인 속성)
                     }
                 ]
             },
             options: {//차트의 옵션
                 scales: {
                     y: {
                         beginAtZero: true
                     }
                 }
             }
         });
     }
     
 });